`timescale 1ns / 1ps
module clock_divide_by_3_tb;
reg clk;
wire clk_out;

clock_divide_by_3 dut(clk, clk_out);

always #5 clk = ~clk;

initial begin
    clk = 0;#200;
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b clk_out=%b", $time, clk, clk_out);
    $dumpfile("clock_divide_by_3.vcd");
    $dumpvars(0,clock_divide_by_3_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1VCXg0EJ8kpjR9mPaJQ0R7-2qoYRyN4Kb/view?usp=sharing
* OUTPUT
VCD info: dumpfile clock_divide_by_3.vcd opened for output.
t=0 clk=0 clk_out=x
t=5000 clk=1 clk_out=0
t=10000 clk=0 clk_out=0
t=15000 clk=1 clk_out=0
t=20000 clk=0 clk_out=0
t=25000 clk=1 clk_out=1
t=30000 clk=0 clk_out=1
t=35000 clk=1 clk_out=0
t=40000 clk=0 clk_out=0
t=45000 clk=1 clk_out=0
t=50000 clk=0 clk_out=0
t=55000 clk=1 clk_out=1
t=60000 clk=0 clk_out=1
t=65000 clk=1 clk_out=0
t=70000 clk=0 clk_out=0
t=75000 clk=1 clk_out=0
t=80000 clk=0 clk_out=0
t=85000 clk=1 clk_out=1
t=90000 clk=0 clk_out=1
t=95000 clk=1 clk_out=0
t=100000 clk=0 clk_out=0
t=105000 clk=1 clk_out=0
t=110000 clk=0 clk_out=0
t=115000 clk=1 clk_out=1
t=120000 clk=0 clk_out=1
t=125000 clk=1 clk_out=0
t=130000 clk=0 clk_out=0
t=135000 clk=1 clk_out=0
t=140000 clk=0 clk_out=0
t=145000 clk=1 clk_out=1
t=150000 clk=0 clk_out=1
t=155000 clk=1 clk_out=0
t=160000 clk=0 clk_out=0
t=165000 clk=1 clk_out=0
t=170000 clk=0 clk_out=0
t=175000 clk=1 clk_out=1
t=180000 clk=0 clk_out=1
t=185000 clk=1 clk_out=0
t=190000 clk=0 clk_out=0
t=195000 clk=1 clk_out=0
clock_divide_by_3_tb.v:12: $finish called at 200000 (1ps)
t=200000 clk=0 clk_out=0
* 
*/

