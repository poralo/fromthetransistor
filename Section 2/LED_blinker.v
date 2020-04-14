// A simple LED blinker module

module LED_blinker(
    input clock, // clock input of the design
    input reset, // reset input
    output LED // output for the LED
);

reg LED;
wire clock, reset;

always @ (posedge clock or posedge reset) begin
    if (reset == 1'b1) begin
        LED = 1;
    end
    LED = ~LED;
end

endmodule