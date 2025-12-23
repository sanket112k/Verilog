module odd_even_counter_tb;
parameter N = 3;
reg clk;
reg reset;
reg e_mode;
wire [N-1:0]count;

odd_even_counter #(.N(N)) dut(clk, reset, e_mode, count);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    e_mode = 1; #10;
    reset = 0;
    repeat(10) @(negedge clk);
    reset = 1;
    e_mode = 0; #10;
    reset = 0;
    repeat(10) @(negedge clk);
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b e_mode=%b count=%b", $time, clk, reset, e_mode, count);
    $dumpfile("odd_even_counter.vcd");
    $dumpvars(0,odd_even_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/10mfWmW2Ve7-ZU_2YFZS06YMdTqSCPDFt/view?usp=drive_link
* OUTPUT
VCD info: dumpfile odd_even_counter.vcd opened for output.
t=0 clk=0 reset=1 e_mode=1 count=001
t=5 clk=1 reset=1 e_mode=1 count=000
t=10 clk=0 reset=0 e_mode=1 count=000
t=15 clk=1 reset=0 e_mode=1 count=010
t=20 clk=0 reset=0 e_mode=1 count=010
t=25 clk=1 reset=0 e_mode=1 count=100
t=30 clk=0 reset=0 e_mode=1 count=100
t=35 clk=1 reset=0 e_mode=1 count=110
t=40 clk=0 reset=0 e_mode=1 count=110
t=45 clk=1 reset=0 e_mode=1 count=000
t=50 clk=0 reset=0 e_mode=1 count=000
t=55 clk=1 reset=0 e_mode=1 count=010
t=60 clk=0 reset=0 e_mode=1 count=010
t=65 clk=1 reset=0 e_mode=1 count=100
t=70 clk=0 reset=0 e_mode=1 count=100
t=75 clk=1 reset=0 e_mode=1 count=110
t=80 clk=0 reset=0 e_mode=1 count=110
t=85 clk=1 reset=0 e_mode=1 count=000
t=90 clk=0 reset=0 e_mode=1 count=000
t=95 clk=1 reset=0 e_mode=1 count=010
t=100 clk=0 reset=1 e_mode=0 count=010
t=105 clk=1 reset=1 e_mode=0 count=001
t=110 clk=0 reset=0 e_mode=0 count=001
t=115 clk=1 reset=0 e_mode=0 count=011
t=120 clk=0 reset=0 e_mode=0 count=011
t=125 clk=1 reset=0 e_mode=0 count=101
t=130 clk=0 reset=0 e_mode=0 count=101
t=135 clk=1 reset=0 e_mode=0 count=111
t=140 clk=0 reset=0 e_mode=0 count=111
t=145 clk=1 reset=0 e_mode=0 count=001
t=150 clk=0 reset=0 e_mode=0 count=001
t=155 clk=1 reset=0 e_mode=0 count=011
t=160 clk=0 reset=0 e_mode=0 count=011
t=165 clk=1 reset=0 e_mode=0 count=101
t=170 clk=0 reset=0 e_mode=0 count=101
t=175 clk=1 reset=0 e_mode=0 count=111
t=180 clk=0 reset=0 e_mode=0 count=111
t=185 clk=1 reset=0 e_mode=0 count=001
t=190 clk=0 reset=0 e_mode=0 count=001
t=195 clk=1 reset=0 e_mode=0 count=011
odd_even_counter_tb.v:22: $finish called at 200 (1s)
t=200 clk=0 reset=0 e_mode=0 count=011
*/ 
