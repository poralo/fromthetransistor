// 2 inpute or gate test-bench
`timescale 1s/100ms
`include "or2.v"

module or2_tb();
reg a;
reg b;
wire y;

or2 ior2(a, b, y);

initial
begin
    $monitor("a=%b, b=%b, y=%b", a, b, y);
    $dumpfile("or2.vcd");
    $dumpvars(0, or2_tb);
    a = 0; b = 0; #5;
    a = 0; b = 1; #10;
    a = 1; b = 0; #5;
    a = 1; b = 1; #10;
    $finish;
end

endmodule


