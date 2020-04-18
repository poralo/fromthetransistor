// A simple transmiter from a UART
module transmitter(
    input [7:0] byte,
    input start_transfert,
    input clock,
    output reg serial_output
);

reg idle_mode = 1'b1;
reg transmit_mode = 1'b0;

reg start_bit = 1'b1;
reg [4:0] bit_counter = 0;


always @ (posedge clock && idle_mode) begin
    serial_output = 1'b1;
    start_bit = 1'b1;
    bit_counter = 0;
end

always @ (posedge clock && transmit_mode) begin
    if (start_bit) begin
        serial_output = 1'b0;
        idle_mode = 1'b0;
        start_bit = 1'b0;
        bit_counter = 0;
    end else begin
        if (bit_counter < 8) begin
            serial_output = byte[bit_counter];
            bit_counter = bit_counter + 1;
        end else begin
            idle_mode = 1'b1;
            transmit_mode = 1'b0;
            bit_counter = 0;
        end
        
    end
end

always @ (posedge start_transfert) transmit_mode = 1'b1;

endmodule