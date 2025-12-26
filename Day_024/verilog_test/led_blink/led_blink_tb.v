`timescale 1ns / 1ns;
module led_blink_tb;
reg clk, rst;
wire led;

led_blink dut(clk,rst,led);

always #10 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    repeat(20) @(posedge clk);
    rst = 1;
    repeat(2) @(posedge clk);
    rst = 0;
    repeat(200_000_000) @(posedge clk);
    $finish;
end
initial begin
    $monitor("rst=%b led=%b",rst,led);
    $dumpfile("led_blink.vcd");
    $dumpvars(0,led_blink_tb);
end
endmodule
