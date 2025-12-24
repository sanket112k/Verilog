module clock_divide_by_2_tb;
reg clk;
wire clk_out;

clock_divide_by_2 dut(clk, clk_out);

always #5 clk = ~clk;

initial begin
    clk = 0;#200;
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b clk_out=%b", $time, clk, clk_out);
    $dumpfile("clock_divide_by_2.vcd");
    $dumpvars(0,clock_divide_by_2_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1PETSV88LK0o1COhD1mz5iHJfspncE0Iz/view?usp=sharing
* OUTPUT
VCD info: dumpfile clock_divide_by_2.vcd opened for output.
t=0 clk=0 clk_out=x
t=5 clk=1 clk_out=0
t=10 clk=0 clk_out=0
t=15 clk=1 clk_out=1
t=20 clk=0 clk_out=1
t=25 clk=1 clk_out=0
t=30 clk=0 clk_out=0
t=35 clk=1 clk_out=1
t=40 clk=0 clk_out=1
t=45 clk=1 clk_out=0
t=50 clk=0 clk_out=0
t=55 clk=1 clk_out=1
t=60 clk=0 clk_out=1
t=65 clk=1 clk_out=0
t=70 clk=0 clk_out=0
t=75 clk=1 clk_out=1
t=80 clk=0 clk_out=1
t=85 clk=1 clk_out=0
t=90 clk=0 clk_out=0
t=95 clk=1 clk_out=1
t=100 clk=0 clk_out=1
t=105 clk=1 clk_out=0
t=110 clk=0 clk_out=0
t=115 clk=1 clk_out=1
t=120 clk=0 clk_out=1
t=125 clk=1 clk_out=0
t=130 clk=0 clk_out=0
t=135 clk=1 clk_out=1
t=140 clk=0 clk_out=1
t=145 clk=1 clk_out=0
t=150 clk=0 clk_out=0
t=155 clk=1 clk_out=1
t=160 clk=0 clk_out=1
t=165 clk=1 clk_out=0
t=170 clk=0 clk_out=0
t=175 clk=1 clk_out=1
t=180 clk=0 clk_out=1
t=185 clk=1 clk_out=0
t=190 clk=0 clk_out=0
t=195 clk=1 clk_out=1
clock_divide_by_2_tb.v:11: $finish called at 200 (1s)
t=200 clk=0 clk_out=1
* 
*/

