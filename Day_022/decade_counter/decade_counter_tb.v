module decade_counter_tb;
reg clk;
reg reset;
wire [3:0]count;

decade_counter dut(clk, reset, count);

always #5 clk = ~clk;

initial begin
    clk=0;
    reset = 0;
    repeat(10) @(posedge clk);
    reset = 1;
    repeat(4) @(posedge clk);
    reset = 0;
    repeat(20) @(posedge clk);
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b count=%b", $time, clk, reset, count);
    $dumpfile("decade_counter.vcd");
    $dumpvars(0,decade_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1M8X5bMEbF_v_9S8jg6WAfK1H2tsxwhl_/view?usp=sharing
* OUTPUT
VCD info: dumpfile decade_counter.vcd opened for output.
t=0 clk=0 reset=0 count=0000
t=5 clk=1 reset=0 count=0001
t=10 clk=0 reset=0 count=0001
t=15 clk=1 reset=0 count=0010
t=20 clk=0 reset=0 count=0010
t=25 clk=1 reset=0 count=0011
t=30 clk=0 reset=0 count=0011
t=35 clk=1 reset=0 count=0100
t=40 clk=0 reset=0 count=0100
t=45 clk=1 reset=0 count=0101
t=50 clk=0 reset=0 count=0101
t=55 clk=1 reset=0 count=0110
t=60 clk=0 reset=0 count=0110
t=65 clk=1 reset=0 count=0111
t=70 clk=0 reset=0 count=0111
t=75 clk=1 reset=0 count=1000
t=80 clk=0 reset=0 count=1000
t=85 clk=1 reset=0 count=1001
t=90 clk=0 reset=0 count=1001
t=95 clk=1 reset=1 count=0000
t=100 clk=0 reset=1 count=0000
t=105 clk=1 reset=1 count=0000
t=110 clk=0 reset=1 count=0000
t=115 clk=1 reset=1 count=0000
t=120 clk=0 reset=1 count=0000
t=125 clk=1 reset=1 count=0000
t=130 clk=0 reset=1 count=0000
t=135 clk=1 reset=0 count=0000
t=140 clk=0 reset=0 count=0000
t=145 clk=1 reset=0 count=0001
t=150 clk=0 reset=0 count=0001
t=155 clk=1 reset=0 count=0010
t=160 clk=0 reset=0 count=0010
t=165 clk=1 reset=0 count=0011
t=170 clk=0 reset=0 count=0011
t=175 clk=1 reset=0 count=0100
t=180 clk=0 reset=0 count=0100
t=185 clk=1 reset=0 count=0101
t=190 clk=0 reset=0 count=0101
t=195 clk=1 reset=0 count=0110
t=200 clk=0 reset=0 count=0110
t=205 clk=1 reset=0 count=0111
t=210 clk=0 reset=0 count=0111
t=215 clk=1 reset=0 count=1000
t=220 clk=0 reset=0 count=1000
t=225 clk=1 reset=0 count=1001
t=230 clk=0 reset=0 count=1001
t=235 clk=1 reset=0 count=0000
t=240 clk=0 reset=0 count=0000
t=245 clk=1 reset=0 count=0001
t=250 clk=0 reset=0 count=0001
t=255 clk=1 reset=0 count=0010
t=260 clk=0 reset=0 count=0010
t=265 clk=1 reset=0 count=0011
t=270 clk=0 reset=0 count=0011
t=275 clk=1 reset=0 count=0100
t=280 clk=0 reset=0 count=0100
t=285 clk=1 reset=0 count=0101
t=290 clk=0 reset=0 count=0101
t=295 clk=1 reset=0 count=0110
t=300 clk=0 reset=0 count=0110
t=305 clk=1 reset=0 count=0111
t=310 clk=0 reset=0 count=0111
t=315 clk=1 reset=0 count=1000
t=320 clk=0 reset=0 count=1000
t=325 clk=1 reset=0 count=1001
t=330 clk=0 reset=0 count=1001
decade_counter_tb.v:18: $finish called at 335 (1s)
t=335 clk=1 reset=0 count=0000
*/ 
