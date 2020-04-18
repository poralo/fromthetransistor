// A simple receiver from a UART
module receiver(
    input stream,
    input clock,
    output reg [7:0] byte
);

reg [3:0] bit_counter;
reg record = 1'b0;

always @ (posedge clock && record) #1 begin
    byte[bit_counter] <= stream;
    bit_counter <= bit_counter + 1;
    if (bit_counter > 7) begin
        bit_counter = 0;
        record = 1'b0;
    end
end

always @ (negedge stream && (record == 1'b0)) #1 begin
    record = 1'b1;
    byte = 0;
    bit_counter = 0;
end

endmodule