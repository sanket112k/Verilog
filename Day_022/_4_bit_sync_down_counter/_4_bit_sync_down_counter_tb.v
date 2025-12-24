module _4_bit_sync_down_counter_tb;
reg clk;
reg reset;
wire [3:0]count;

_4_bit_sync_down_counter dut(clk, reset, count);

always #5 clk = ~clk;

initial begin
    clk=0;
    repeat(10) begin
        @(posedge clk);
        reset = 0;
    end
    repeat(4) begin
        @(negedge clk);
        reset = 1;
    end
    repeat(20) begin
        @(posedge clk);
        reset = 0;
    end
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b count=%b", $time, clk, reset, count);
    $dumpfile("_4_bit_sync_down_counter.vcd");
    $dumpvars(0,_4_bit_sync_down_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/12n0BlIczVlzk4ke9AGi1k30khZd8Aa_m/view?usp=sharing
* OUTPUT
VCD info: dumpfile _4_bit_sync_down_counter.vcd opened for output.
t=0 clk=0 reset=x count=0000
t=5 clk=1 reset=0 count=1111
t=10 clk=0 reset=0 count=1111
t=15 clk=1 reset=0 count=1110
t=20 clk=0 reset=0 count=1110
t=25 clk=1 reset=0 count=1101
t=30 clk=0 reset=0 count=1101
t=35 clk=1 reset=0 count=1100
t=40 clk=0 reset=0 count=1100
t=45 clk=1 reset=0 count=1011
t=50 clk=0 reset=0 count=1011
t=55 clk=1 reset=0 count=1010
t=60 clk=0 reset=0 count=1010
t=65 clk=1 reset=0 count=1001
t=70 clk=0 reset=0 count=1001
t=75 clk=1 reset=0 count=1000
t=80 clk=0 reset=0 count=1000
t=85 clk=1 reset=0 count=0111
t=90 clk=0 reset=0 count=0111
t=95 clk=1 reset=0 count=0110
t=100 clk=0 reset=1 count=0110
t=105 clk=1 reset=1 count=0000
t=110 clk=0 reset=1 count=0000
t=115 clk=1 reset=1 count=0000
t=120 clk=0 reset=1 count=0000
t=125 clk=1 reset=1 count=0000
t=130 clk=0 reset=1 count=0000
t=135 clk=1 reset=0 count=1111
t=140 clk=0 reset=0 count=1111
t=145 clk=1 reset=0 count=1110
t=150 clk=0 reset=0 count=1110
t=155 clk=1 reset=0 count=1101
t=160 clk=0 reset=0 count=1101
t=165 clk=1 reset=0 count=1100
t=170 clk=0 reset=0 count=1100
t=175 clk=1 reset=0 count=1011
t=180 clk=0 reset=0 count=1011
t=185 clk=1 reset=0 count=1010
t=190 clk=0 reset=0 count=1010
t=195 clk=1 reset=0 count=1001
t=200 clk=0 reset=0 count=1001
t=205 clk=1 reset=0 count=1000
t=210 clk=0 reset=0 count=1000
t=215 clk=1 reset=0 count=0111
t=220 clk=0 reset=0 count=0111
t=225 clk=1 reset=0 count=0110
t=230 clk=0 reset=0 count=0110
t=235 clk=1 reset=0 count=0101
t=240 clk=0 reset=0 count=0101
t=245 clk=1 reset=0 count=0100
t=250 clk=0 reset=0 count=0100
t=255 clk=1 reset=0 count=0011
t=260 clk=0 reset=0 count=0011
t=265 clk=1 reset=0 count=0010
t=270 clk=0 reset=0 count=0010
t=275 clk=1 reset=0 count=0001
t=280 clk=0 reset=0 count=0001
t=285 clk=1 reset=0 count=0000
t=290 clk=0 reset=0 count=0000
t=295 clk=1 reset=0 count=1111
t=300 clk=0 reset=0 count=1111
t=305 clk=1 reset=0 count=1110
t=310 clk=0 reset=0 count=1110
t=315 clk=1 reset=0 count=1101
t=320 clk=0 reset=0 count=1101
_4_bit_sync_down_counter_tb.v:24: $finish called at 325 (1s)
t=325 clk=1 reset=0 count=1100
*/ 
