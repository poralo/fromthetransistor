// UART test-bench
`include "transmitter.v"
`include "receiver.v"

module uart_tb();
reg [7:0] tx_byte = 230;
reg clock;
reg start_transfert;

wire [7:0] rx_byte;

transmitter TX (
    tx_byte,
    start_transfert,
    clock,
    serial_output
);

receiver RX (
    serial_output,
    clock,
    rx_byte
);

initial begin
    $monitor("CLOCK: %b\tbyte=%g  => output = %b", clock, tx_byte, serial_output);
    $dumpfile("uart.vcd");
    $dumpvars(0, uart_tb);
    start_transfert = 0;
    clock = 1;

    #10 start_transfert <= 1'b1;
    #1 start_transfert <= 1'b0;

    #30 $finish;
end

always  #1  clock = ~clock;

endmodule