module counter_with_loadable_input_tb;
reg clk;
reg reset;
reg load_en;
reg [3:0]cstart;
wire [3:0]count;

counter_with_loadable_input dut(clk, reset, load_en, cstart, count);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 0;
    cstart = 4'h9;
    load_en = 1; #15;
    load_en = 0;
    repeat(10) @(posedge clk);
    reset = 1;
    repeat(4) @(negedge clk);
    reset = 0;
    cstart = 4'h5;
    load_en = 1; #15;
    load_en = 0;
    repeat(20) @(posedge clk);
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b load_en=%b cstart=%b count=%b", $time, clk, reset,load_en, cstart, count);
    $dumpfile("counter_with_loadable_input.vcd");
    $dumpvars(0,counter_with_loadable_input_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1cYGF4m1dluFaP79q1E17qigSK_s5Z8qu/view?usp=drive_link
* OUTPUT
VCD info: dumpfile counter_with_loadable_input.vcd opened for output.
t=0 clk=0 reset=0 load_en=1 cstart=1001 count=xxxx
t=5 clk=1 reset=0 load_en=1 cstart=1001 count=1001
t=10 clk=0 reset=0 load_en=1 cstart=1001 count=1001
t=15 clk=1 reset=0 load_en=0 cstart=1001 count=1010
t=20 clk=0 reset=0 load_en=0 cstart=1001 count=1010
t=25 clk=1 reset=0 load_en=0 cstart=1001 count=1011
t=30 clk=0 reset=0 load_en=0 cstart=1001 count=1011
t=35 clk=1 reset=0 load_en=0 cstart=1001 count=1100
t=40 clk=0 reset=0 load_en=0 cstart=1001 count=1100
t=45 clk=1 reset=0 load_en=0 cstart=1001 count=1101
t=50 clk=0 reset=0 load_en=0 cstart=1001 count=1101
t=55 clk=1 reset=0 load_en=0 cstart=1001 count=1110
t=60 clk=0 reset=0 load_en=0 cstart=1001 count=1110
t=65 clk=1 reset=0 load_en=0 cstart=1001 count=1111
t=70 clk=0 reset=0 load_en=0 cstart=1001 count=1111
t=75 clk=1 reset=0 load_en=0 cstart=1001 count=0000
t=80 clk=0 reset=0 load_en=0 cstart=1001 count=0000
t=85 clk=1 reset=0 load_en=0 cstart=1001 count=0001
t=90 clk=0 reset=0 load_en=0 cstart=1001 count=0001
t=95 clk=1 reset=0 load_en=0 cstart=1001 count=0010
t=100 clk=0 reset=0 load_en=0 cstart=1001 count=0010
t=105 clk=1 reset=1 load_en=0 cstart=1001 count=0011
t=110 clk=0 reset=1 load_en=0 cstart=1001 count=0011
t=115 clk=1 reset=1 load_en=0 cstart=1001 count=0000
t=120 clk=0 reset=1 load_en=0 cstart=1001 count=0000
t=125 clk=1 reset=1 load_en=0 cstart=1001 count=0000
t=130 clk=0 reset=1 load_en=0 cstart=1001 count=0000
t=135 clk=1 reset=1 load_en=0 cstart=1001 count=0000
t=140 clk=0 reset=0 load_en=1 cstart=0101 count=0000
t=145 clk=1 reset=0 load_en=1 cstart=0101 count=0101
t=150 clk=0 reset=0 load_en=1 cstart=0101 count=0101
t=155 clk=1 reset=0 load_en=0 cstart=0101 count=0110
t=160 clk=0 reset=0 load_en=0 cstart=0101 count=0110
t=165 clk=1 reset=0 load_en=0 cstart=0101 count=0111
t=170 clk=0 reset=0 load_en=0 cstart=0101 count=0111
t=175 clk=1 reset=0 load_en=0 cstart=0101 count=1000
t=180 clk=0 reset=0 load_en=0 cstart=0101 count=1000
t=185 clk=1 reset=0 load_en=0 cstart=0101 count=1001
t=190 clk=0 reset=0 load_en=0 cstart=0101 count=1001
t=195 clk=1 reset=0 load_en=0 cstart=0101 count=1010
t=200 clk=0 reset=0 load_en=0 cstart=0101 count=1010
t=205 clk=1 reset=0 load_en=0 cstart=0101 count=1011
t=210 clk=0 reset=0 load_en=0 cstart=0101 count=1011
t=215 clk=1 reset=0 load_en=0 cstart=0101 count=1100
t=220 clk=0 reset=0 load_en=0 cstart=0101 count=1100
t=225 clk=1 reset=0 load_en=0 cstart=0101 count=1101
t=230 clk=0 reset=0 load_en=0 cstart=0101 count=1101
t=235 clk=1 reset=0 load_en=0 cstart=0101 count=1110
t=240 clk=0 reset=0 load_en=0 cstart=0101 count=1110
t=245 clk=1 reset=0 load_en=0 cstart=0101 count=1111
t=250 clk=0 reset=0 load_en=0 cstart=0101 count=1111
t=255 clk=1 reset=0 load_en=0 cstart=0101 count=0000
t=260 clk=0 reset=0 load_en=0 cstart=0101 count=0000
t=265 clk=1 reset=0 load_en=0 cstart=0101 count=0001
t=270 clk=0 reset=0 load_en=0 cstart=0101 count=0001
t=275 clk=1 reset=0 load_en=0 cstart=0101 count=0010
t=280 clk=0 reset=0 load_en=0 cstart=0101 count=0010
t=285 clk=1 reset=0 load_en=0 cstart=0101 count=0011
t=290 clk=0 reset=0 load_en=0 cstart=0101 count=0011
t=295 clk=1 reset=0 load_en=0 cstart=0101 count=0100
t=300 clk=0 reset=0 load_en=0 cstart=0101 count=0100
t=305 clk=1 reset=0 load_en=0 cstart=0101 count=0101
t=310 clk=0 reset=0 load_en=0 cstart=0101 count=0101
t=315 clk=1 reset=0 load_en=0 cstart=0101 count=0110
t=320 clk=0 reset=0 load_en=0 cstart=0101 count=0110
t=325 clk=1 reset=0 load_en=0 cstart=0101 count=0111
t=330 clk=0 reset=0 load_en=0 cstart=0101 count=0111
t=335 clk=1 reset=0 load_en=0 cstart=0101 count=1000
t=340 clk=0 reset=0 load_en=0 cstart=0101 count=1000
counter_with_loadable_input_tb.v:26: $finish called at 345 (1s)
t=345 clk=1 reset=0 load_en=0 cstart=0101 count=1001
*/ 
