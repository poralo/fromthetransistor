// A simple transmiter from a UART
module transmitter(
    input [7:0] byte,
    input start_transfert,
    input clock,
    output reg serial_output
);

reg idle = 1'b1;
reg start_bit = 1'b1;
reg [7:0] bit_counter = 0;
reg transmit = 1'b0;

always @ (posedge clock && idle) begin
    serial_output = 1'b1;
    start_bit = 1'b1;
end

always @ (posedge clock && transmit) begin
    if (start_bit) begin
        serial_output = 1'b0;
        idle = 1'b0;
        start_bit = 1'b0;
    end else begin
        if (bit_counter < 7) begin
            serial_output = byte[bit_counter];
            bit_counter <= bit_counter + 1;
        end else begin
            idle = 1'b1;
            transmit = 1'b0;
            bit_counter = 0;
        end
        
    end
end

always @ (posedge start_transfert) transmit = 1'b1;

endmodule