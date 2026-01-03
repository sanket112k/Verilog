`timescale 1ns/1ns
module baud_tick_generator_tb;
reg clk, enable;
wire tick;

baud_tick_generator dut(clk, enable, tick);

always #10 clk = ~clk;

initial begin
    clk = 1'b0;
    enable = 1'b1;
    #100_000_000;
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b tick=%b",$time, clk, tick);
    $dumpfile("baud_tick_generator.vcd");
    $dumpvars(0,baud_tick_generator_tb);
end
endmodule
