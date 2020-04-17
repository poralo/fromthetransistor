// // A transmitter from a UART
`include "transmitter.v"

module transmitter_tb();
reg [7:0] byte = 3;
reg clock;
reg start_transfert;

transmitter TX (
    byte,
    start_transfert,
    clock,
    serial_output
);

initial begin
    $monitor("CLOCK: %b\tbyte=%g  => output = %b", clock, byte, serial_output);
    $dumpfile("transmitter.vcd");
    $dumpvars(0, TX);
    start_transfert = 0;
    clock = 1;

    #10 start_transfert <= 1'b1;
    #1 start_transfert <= 1'b0;

    #30 $finish;
end

always  #1  clock = ~clock;

endmodule