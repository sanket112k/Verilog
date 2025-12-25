`timescale 1ns / 1ns
module clock_divider_with_specific_duty_cycle_tb;
parameter N=3;
parameter DC=50;
reg clk;
wire clk_out;

clock_divider_with_specific_duty_cycle #(.N(5),.DC(30)) dut0(clk, clk_out);


always #5 clk = ~clk;

initial begin
    clk = 0;#200;
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b clk_out=%b", $time, clk, clk_out);
    $dumpfile("clock_divider_with_specific_duty_cycle.vcd");
    $dumpvars(0,clock_divider_with_specific_duty_cycle_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1wFqX6MKUR5OVgax5Pv9WxqnpzCxRfqLU/view?usp=sharing
* OUTPUT
VCD info: dumpfile clock_divider_with_specific_duty_cycle.vcd opened for output.
t=0 clk=0 clk_out=x
t=5 clk=1 clk_out=1
t=10 clk=0 clk_out=1
t=15 clk=1 clk_out=1
t=20 clk=0 clk_out=0
t=25 clk=1 clk_out=0
t=30 clk=0 clk_out=0
t=35 clk=1 clk_out=0
t=40 clk=0 clk_out=0
t=45 clk=1 clk_out=0
t=50 clk=0 clk_out=0
t=55 clk=1 clk_out=1
t=60 clk=0 clk_out=1
t=65 clk=1 clk_out=1
t=70 clk=0 clk_out=0
t=75 clk=1 clk_out=0
t=80 clk=0 clk_out=0
t=85 clk=1 clk_out=0
t=90 clk=0 clk_out=0
t=95 clk=1 clk_out=0
t=100 clk=0 clk_out=0
t=105 clk=1 clk_out=1
t=110 clk=0 clk_out=1
t=115 clk=1 clk_out=1
t=120 clk=0 clk_out=0
t=125 clk=1 clk_out=0
t=130 clk=0 clk_out=0
t=135 clk=1 clk_out=0
t=140 clk=0 clk_out=0
t=145 clk=1 clk_out=0
t=150 clk=0 clk_out=0
t=155 clk=1 clk_out=1
t=160 clk=0 clk_out=1
t=165 clk=1 clk_out=1
t=170 clk=0 clk_out=0
t=175 clk=1 clk_out=0
t=180 clk=0 clk_out=0
t=185 clk=1 clk_out=0
t=190 clk=0 clk_out=0
t=195 clk=1 clk_out=0
clock_divider_with_specific_duty_cycle_tb.v:15: $finish called at 200 (1ns)
t=200 clk=0 clk_out=0
* 
*/

