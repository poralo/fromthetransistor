// LED blinker test-bench
`include "LED_blinker.v"

module LED_blinker_tb();
reg clock;
reg reset;
wire LED;

// Initialization
initial begin
    $monitor("%g\t clock=%b, reset=%b, LED=%b", $time, clock, reset, LED);
    $dumpfile("LED_blinker.vcd");
    $dumpvars(0, LED_b);
    clock = 1; // initial value of clock
    #2 reset = 1; // We wait 2 tick then we reset the blinking
    #2 reset = 0;
    #13 reset = 1;
    #15 reset = 0;
    #50 $finish;
end

// Clock generator
always #2 clock = ~clock;

LED_blinker LED_b(
    clock,
    reset,
    LED
);

endmodule