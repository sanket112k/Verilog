`timescale 1ns/1ns
module bidirectional_shift_register_tb;
parameter N = 8;
reg clk;
reg m;
reg sin_l;
reg sin_r;
reg reset;
wire [N-1:0]pout;

integer delay;
bidirectional_shift_register #(.N(N)) dut(clk, m, sin_l, sin_r, reset, pout);

initial begin
    clk = 0;
    reset = 0;
    forever #5 clk = ~clk;
end

initial begin
    repeat (N*4) begin
        @(negedge clk);
        if (m) sin_r = $urandom_range(0,1);
        else sin_l = $urandom_range(0,1);
    end
    reset = 1; #10;
    reset = 0;
    repeat (N*4) begin
        @(negedge clk);
        if (m) sin_r = $urandom_range(0,1);
        else sin_l = $urandom_range(0,1);
    end
    $finish;
end

initial begin
    delay = N*10;
    @(negedge clk) m=1;
    forever begin
        #delay m = ~m;
    end
end

initial begin
    $printtimescale;
    $monitor("time=%0t reset=%b m=%b clk=%b sin_r=%b sin_l=%b pout=%b", $time, reset, m, clk, sin_r, sin_l, pout);
    $dumpfile("bidirectional_shift_register.vcd");
    $dumpvars(0,bidirectional_shift_register_tb);
end

endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1OfyQCCx-wphfwVW5dAENJUg9QGmq7LEn/view?usp=sharing
*
* OUTPUT
Time scale of (bidirectional_shift_register_tb) is 1ns / 1ns
VCD info: dumpfile bidirectional_shift_register.vcd opened for output.
time=0 reset=0 m=x clk=0 sin_r=x sin_l=x pout=xxxxxxxx
time=5 reset=0 m=x clk=1 sin_r=x sin_l=x pout=xxxxxxxx
time=10 reset=0 m=1 clk=0 sin_r=1 sin_l=x pout=xxxxxxxx
time=15 reset=0 m=1 clk=1 sin_r=1 sin_l=x pout=1xxxxxxx
time=20 reset=0 m=1 clk=0 sin_r=0 sin_l=x pout=1xxxxxxx
time=25 reset=0 m=1 clk=1 sin_r=0 sin_l=x pout=01xxxxxx
time=30 reset=0 m=1 clk=0 sin_r=0 sin_l=x pout=01xxxxxx
time=35 reset=0 m=1 clk=1 sin_r=0 sin_l=x pout=001xxxxx
time=40 reset=0 m=1 clk=0 sin_r=0 sin_l=x pout=001xxxxx
time=45 reset=0 m=1 clk=1 sin_r=0 sin_l=x pout=0001xxxx
time=50 reset=0 m=1 clk=0 sin_r=1 sin_l=x pout=0001xxxx
time=55 reset=0 m=1 clk=1 sin_r=1 sin_l=x pout=10001xxx
time=60 reset=0 m=1 clk=0 sin_r=1 sin_l=x pout=10001xxx
time=65 reset=0 m=1 clk=1 sin_r=1 sin_l=x pout=110001xx
time=70 reset=0 m=1 clk=0 sin_r=0 sin_l=x pout=110001xx
time=75 reset=0 m=1 clk=1 sin_r=0 sin_l=x pout=0110001x
time=80 reset=0 m=1 clk=0 sin_r=0 sin_l=x pout=0110001x
time=85 reset=0 m=1 clk=1 sin_r=0 sin_l=x pout=00110001
time=90 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=00110001
time=95 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=01100011
time=100 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01100011
time=105 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=11000111
time=110 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=11000111
time=115 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=10001111
time=120 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=10001111
time=125 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=00011111
time=130 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=00011111
time=135 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=00111111
time=140 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=00111111
time=145 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=01111111
time=150 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01111111
time=155 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=11111111
time=160 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=11111111
time=165 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=11111110
time=170 reset=0 m=1 clk=0 sin_r=0 sin_l=0 pout=11111110
time=175 reset=0 m=1 clk=1 sin_r=0 sin_l=0 pout=01111111
time=180 reset=0 m=1 clk=0 sin_r=0 sin_l=0 pout=01111111
time=185 reset=0 m=1 clk=1 sin_r=0 sin_l=0 pout=00111111
time=190 reset=0 m=1 clk=0 sin_r=1 sin_l=0 pout=00111111
time=195 reset=0 m=1 clk=1 sin_r=1 sin_l=0 pout=10011111
time=200 reset=0 m=1 clk=0 sin_r=0 sin_l=0 pout=10011111
time=205 reset=0 m=1 clk=1 sin_r=0 sin_l=0 pout=01001111
time=210 reset=0 m=1 clk=0 sin_r=0 sin_l=0 pout=01001111
time=215 reset=0 m=1 clk=1 sin_r=0 sin_l=0 pout=00100111
time=220 reset=0 m=1 clk=0 sin_r=1 sin_l=0 pout=00100111
time=225 reset=0 m=1 clk=1 sin_r=1 sin_l=0 pout=10010011
time=230 reset=0 m=1 clk=0 sin_r=1 sin_l=0 pout=10010011
time=235 reset=0 m=1 clk=1 sin_r=1 sin_l=0 pout=11001001
time=240 reset=0 m=1 clk=0 sin_r=0 sin_l=0 pout=11001001
time=245 reset=0 m=1 clk=1 sin_r=0 sin_l=0 pout=01100100
time=250 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=01100100
time=255 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=11001000
time=260 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=11001000
time=265 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=10010000
time=270 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=10010000
time=275 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=00100001
time=280 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00100001
time=285 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=01000010
time=290 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=01000010
time=295 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=10000100
time=300 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=10000100
time=305 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=00001000
time=310 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00001000
time=315 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=00010000
time=320 reset=1 m=0 clk=0 sin_r=0 sin_l=1 pout=00010000
time=325 reset=1 m=0 clk=1 sin_r=0 sin_l=1 pout=00000000
time=330 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=00000000
time=335 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00000000
time=340 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=00000000
time=345 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=10000000
time=350 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=10000000
time=355 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=11000000
time=360 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=11000000
time=365 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=01100000
time=370 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=01100000
time=375 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00110000
time=380 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=00110000
time=385 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00011000
time=390 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=00011000
time=395 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00001100
time=400 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=00001100
time=405 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00000110
time=410 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=00000110
time=415 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=00001101
time=420 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00001101
time=425 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=00011010
time=430 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00011010
time=435 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=00110100
time=440 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00110100
time=445 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=01101000
time=450 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01101000
time=455 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=11010001
time=460 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=11010001
time=465 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=10100010
time=470 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=10100010
time=475 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=01000101
time=480 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01000101
time=485 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=10001011
time=490 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=10001011
time=495 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=01000101
time=500 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=01000101
time=505 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=00100010
time=510 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=00100010
time=515 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=10010001
time=520 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=10010001
time=525 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=11001000
time=530 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=11001000
time=535 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=11100100
time=540 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=11100100
time=545 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=01110010
time=550 reset=0 m=1 clk=0 sin_r=1 sin_l=1 pout=01110010
time=555 reset=0 m=1 clk=1 sin_r=1 sin_l=1 pout=10111001
time=560 reset=0 m=1 clk=0 sin_r=0 sin_l=1 pout=10111001
time=565 reset=0 m=1 clk=1 sin_r=0 sin_l=1 pout=01011100
time=570 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01011100
time=575 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=10111001
time=580 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=10111001
time=585 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=01110011
time=590 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=01110011
time=595 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=11100111
time=600 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=11100111
time=605 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=11001111
time=610 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=11001111
time=615 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=10011110
time=620 reset=0 m=0 clk=0 sin_r=0 sin_l=1 pout=10011110
time=625 reset=0 m=0 clk=1 sin_r=0 sin_l=1 pout=00111101
time=630 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=00111101
time=635 reset=0 m=0 clk=1 sin_r=0 sin_l=0 pout=01111010
bidirectional_shift_register_tb.v:33: $finish called at 640 (1ns)
time=640 reset=0 m=0 clk=0 sin_r=0 sin_l=0 pout=01111010
* 
*/
