`timescale 1ns/1ns
module universal_shift_register_tb;
parameter N = 8;
reg clk;
reg reset;
reg [1:0]m;
reg sin_l, sin_r;
reg [N-1:0]pin;
wire [N-1:0]pout;

universal_shift_register #(.N(N)) dut(clk, reset, m, sin_l, sin_r, pin, pout);

initial begin
    clk = 0;
    reset = 0;
    forever #5 clk = ~clk;
end

initial begin
    m = 2'h3;
    pin = $urandom_range({N{1'b0}},{N{1'b1}});
    repeat (N*4) begin
        @(negedge clk);
        m= $urandom_range(2'b00,2'b11);
        if (m==2'h1) sin_r = $urandom_range(0,1);
        else if (m==2'h2) sin_l = $urandom_range(0,1);
        else if (m==2'h3) pin = $urandom_range({N{1'b0}},{N{1'b1}});
    end
    reset = 1; #20;
    reset = 0;
    repeat (N*4) begin
        @(negedge clk);
        m= $urandom_range(2'b00,2'b11);
        if (m==2'h1) sin_r = $urandom_range(0,1);
        else if (m==2'h2) sin_l = $urandom_range(0,1);
        else if (m==2'h3) pin = $urandom_range({N{1'b0}},{N{1'b1}});
    end
    $finish;
end

initial begin
    $printtimescale;
    $monitor("time=%0t reset=%b m=%b clk=%b pin=%b sin_r=%b sin_l=%b pout=%b", $time, reset, m, clk, pin, sin_r, sin_l, pout);
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0,universal_shift_register_tb);
end

endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1af2mhM62hDdjGpihKjldZFjAaSgWPLc2/view?usp=sharing
*
* OUTPUT
Time scale of (universal_shift_register_tb) is 1ns / 1ns
VCD info: dumpfile universal_shift_register.vcd opened for output.
time=0 reset=0 m=11 clk=0 pin=10010010 sin_r=x sin_l=x pout=xxxxxxxx
time=5 reset=0 m=11 clk=1 pin=10010010 sin_r=x sin_l=x pout=10010010
time=10 reset=0 m=01 clk=0 pin=10010010 sin_r=0 sin_l=x pout=10010010
time=15 reset=0 m=01 clk=1 pin=10010010 sin_r=0 sin_l=x pout=01001001
time=20 reset=0 m=00 clk=0 pin=10010010 sin_r=0 sin_l=x pout=01001001
time=25 reset=0 m=00 clk=1 pin=10010010 sin_r=0 sin_l=x pout=01001001
time=30 reset=0 m=10 clk=0 pin=10010010 sin_r=0 sin_l=1 pout=01001001
time=35 reset=0 m=10 clk=1 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=40 reset=0 m=00 clk=0 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=45 reset=0 m=00 clk=1 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=50 reset=0 m=00 clk=0 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=55 reset=0 m=00 clk=1 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=60 reset=0 m=10 clk=0 pin=10010010 sin_r=0 sin_l=1 pout=10010011
time=65 reset=0 m=10 clk=1 pin=10010010 sin_r=0 sin_l=1 pout=00100111
time=70 reset=0 m=10 clk=0 pin=10010010 sin_r=0 sin_l=1 pout=00100111
time=75 reset=0 m=10 clk=1 pin=10010010 sin_r=0 sin_l=1 pout=01001111
time=80 reset=0 m=11 clk=0 pin=11000110 sin_r=0 sin_l=1 pout=01001111
time=85 reset=0 m=11 clk=1 pin=11000110 sin_r=0 sin_l=1 pout=11000110
time=90 reset=0 m=11 clk=0 pin=01100011 sin_r=0 sin_l=1 pout=11000110
time=95 reset=0 m=11 clk=1 pin=01100011 sin_r=0 sin_l=1 pout=01100011
time=100 reset=0 m=01 clk=0 pin=01100011 sin_r=0 sin_l=1 pout=01100011
time=105 reset=0 m=01 clk=1 pin=01100011 sin_r=0 sin_l=1 pout=00110001
time=110 reset=0 m=11 clk=0 pin=00111011 sin_r=0 sin_l=1 pout=00110001
time=115 reset=0 m=11 clk=1 pin=00111011 sin_r=0 sin_l=1 pout=00111011
time=120 reset=0 m=00 clk=0 pin=00111011 sin_r=0 sin_l=1 pout=00111011
time=125 reset=0 m=00 clk=1 pin=00111011 sin_r=0 sin_l=1 pout=00111011
time=130 reset=0 m=11 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=00111011
time=135 reset=0 m=11 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=11111001
time=140 reset=0 m=01 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=11111001
time=145 reset=0 m=01 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=01111100
time=150 reset=0 m=01 clk=0 pin=11111001 sin_r=1 sin_l=1 pout=01111100
time=155 reset=0 m=01 clk=1 pin=11111001 sin_r=1 sin_l=1 pout=10111110
time=160 reset=0 m=01 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=10111110
time=165 reset=0 m=01 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=01011111
time=170 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=01011111
time=175 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=01011111
time=180 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=01011111
time=185 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=01011111
time=190 reset=0 m=10 clk=0 pin=11111001 sin_r=0 sin_l=0 pout=01011111
time=195 reset=0 m=10 clk=1 pin=11111001 sin_r=0 sin_l=0 pout=10111110
time=200 reset=0 m=10 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=10111110
time=205 reset=0 m=10 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=01111101
time=210 reset=0 m=01 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=01111101
time=215 reset=0 m=01 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=220 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=225 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=230 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=235 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=240 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=245 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=1 pout=00111110
time=250 reset=0 m=10 clk=0 pin=11111001 sin_r=0 sin_l=0 pout=00111110
time=255 reset=0 m=10 clk=1 pin=11111001 sin_r=0 sin_l=0 pout=01111100
time=260 reset=0 m=00 clk=0 pin=11111001 sin_r=0 sin_l=0 pout=01111100
time=265 reset=0 m=00 clk=1 pin=11111001 sin_r=0 sin_l=0 pout=01111100
time=270 reset=0 m=01 clk=0 pin=11111001 sin_r=1 sin_l=0 pout=01111100
time=275 reset=0 m=01 clk=1 pin=11111001 sin_r=1 sin_l=0 pout=10111110
time=280 reset=0 m=01 clk=0 pin=11111001 sin_r=1 sin_l=0 pout=10111110
time=285 reset=0 m=01 clk=1 pin=11111001 sin_r=1 sin_l=0 pout=11011111
time=290 reset=0 m=10 clk=0 pin=11111001 sin_r=1 sin_l=0 pout=11011111
time=295 reset=0 m=10 clk=1 pin=11111001 sin_r=1 sin_l=0 pout=10111110
time=300 reset=0 m=00 clk=0 pin=11111001 sin_r=1 sin_l=0 pout=10111110
time=305 reset=0 m=00 clk=1 pin=11111001 sin_r=1 sin_l=0 pout=10111110
time=310 reset=0 m=11 clk=0 pin=11000101 sin_r=1 sin_l=0 pout=10111110
time=315 reset=0 m=11 clk=1 pin=11000101 sin_r=1 sin_l=0 pout=11000101
time=320 reset=1 m=10 clk=0 pin=11000101 sin_r=1 sin_l=0 pout=11000101
time=325 reset=1 m=10 clk=1 pin=11000101 sin_r=1 sin_l=0 pout=00000000
time=330 reset=1 m=10 clk=0 pin=11000101 sin_r=1 sin_l=0 pout=00000000
time=335 reset=1 m=10 clk=1 pin=11000101 sin_r=1 sin_l=0 pout=00000000
time=340 reset=0 m=10 clk=0 pin=11000101 sin_r=1 sin_l=0 pout=00000000
time=345 reset=0 m=10 clk=1 pin=11000101 sin_r=1 sin_l=0 pout=00000000
time=350 reset=0 m=11 clk=0 pin=11011011 sin_r=1 sin_l=0 pout=00000000
time=355 reset=0 m=11 clk=1 pin=11011011 sin_r=1 sin_l=0 pout=11011011
time=360 reset=0 m=11 clk=0 pin=11010111 sin_r=1 sin_l=0 pout=11011011
time=365 reset=0 m=11 clk=1 pin=11010111 sin_r=1 sin_l=0 pout=11010111
time=370 reset=0 m=01 clk=0 pin=11010111 sin_r=1 sin_l=0 pout=11010111
time=375 reset=0 m=01 clk=1 pin=11010111 sin_r=1 sin_l=0 pout=11101011
time=380 reset=0 m=00 clk=0 pin=11010111 sin_r=1 sin_l=0 pout=11101011
time=385 reset=0 m=00 clk=1 pin=11010111 sin_r=1 sin_l=0 pout=11101011
time=390 reset=0 m=00 clk=0 pin=11010111 sin_r=1 sin_l=0 pout=11101011
time=395 reset=0 m=00 clk=1 pin=11010111 sin_r=1 sin_l=0 pout=11101011
time=400 reset=0 m=11 clk=0 pin=10100111 sin_r=1 sin_l=0 pout=11101011
time=405 reset=0 m=11 clk=1 pin=10100111 sin_r=1 sin_l=0 pout=10100111
time=410 reset=0 m=00 clk=0 pin=10100111 sin_r=1 sin_l=0 pout=10100111
time=415 reset=0 m=00 clk=1 pin=10100111 sin_r=1 sin_l=0 pout=10100111
time=420 reset=0 m=10 clk=0 pin=10100111 sin_r=1 sin_l=0 pout=10100111
time=425 reset=0 m=10 clk=1 pin=10100111 sin_r=1 sin_l=0 pout=01001110
time=430 reset=0 m=10 clk=0 pin=10100111 sin_r=1 sin_l=1 pout=01001110
time=435 reset=0 m=10 clk=1 pin=10100111 sin_r=1 sin_l=1 pout=10011101
time=440 reset=0 m=11 clk=0 pin=10110001 sin_r=1 sin_l=1 pout=10011101
time=445 reset=0 m=11 clk=1 pin=10110001 sin_r=1 sin_l=1 pout=10110001
time=450 reset=0 m=10 clk=0 pin=10110001 sin_r=1 sin_l=1 pout=10110001
time=455 reset=0 m=10 clk=1 pin=10110001 sin_r=1 sin_l=1 pout=01100011
time=460 reset=0 m=11 clk=0 pin=11111100 sin_r=1 sin_l=1 pout=01100011
time=465 reset=0 m=11 clk=1 pin=11111100 sin_r=1 sin_l=1 pout=11111100
time=470 reset=0 m=01 clk=0 pin=11111100 sin_r=0 sin_l=1 pout=11111100
time=475 reset=0 m=01 clk=1 pin=11111100 sin_r=0 sin_l=1 pout=01111110
time=480 reset=0 m=00 clk=0 pin=11111100 sin_r=0 sin_l=1 pout=01111110
time=485 reset=0 m=00 clk=1 pin=11111100 sin_r=0 sin_l=1 pout=01111110
time=490 reset=0 m=00 clk=0 pin=11111100 sin_r=0 sin_l=1 pout=01111110
time=495 reset=0 m=00 clk=1 pin=11111100 sin_r=0 sin_l=1 pout=01111110
time=500 reset=0 m=11 clk=0 pin=00100100 sin_r=0 sin_l=1 pout=01111110
time=505 reset=0 m=11 clk=1 pin=00100100 sin_r=0 sin_l=1 pout=00100100
time=510 reset=0 m=01 clk=0 pin=00100100 sin_r=0 sin_l=1 pout=00100100
time=515 reset=0 m=01 clk=1 pin=00100100 sin_r=0 sin_l=1 pout=00010010
time=520 reset=0 m=00 clk=0 pin=00100100 sin_r=0 sin_l=1 pout=00010010
time=525 reset=0 m=00 clk=1 pin=00100100 sin_r=0 sin_l=1 pout=00010010
time=530 reset=0 m=11 clk=0 pin=10000110 sin_r=0 sin_l=1 pout=00010010
time=535 reset=0 m=11 clk=1 pin=10000110 sin_r=0 sin_l=1 pout=10000110
time=540 reset=0 m=01 clk=0 pin=10000110 sin_r=1 sin_l=1 pout=10000110
time=545 reset=0 m=01 clk=1 pin=10000110 sin_r=1 sin_l=1 pout=11000011
time=550 reset=0 m=00 clk=0 pin=10000110 sin_r=1 sin_l=1 pout=11000011
time=555 reset=0 m=00 clk=1 pin=10000110 sin_r=1 sin_l=1 pout=11000011
time=560 reset=0 m=10 clk=0 pin=10000110 sin_r=1 sin_l=1 pout=11000011
time=565 reset=0 m=10 clk=1 pin=10000110 sin_r=1 sin_l=1 pout=10000111
time=570 reset=0 m=00 clk=0 pin=10000110 sin_r=1 sin_l=1 pout=10000111
time=575 reset=0 m=00 clk=1 pin=10000110 sin_r=1 sin_l=1 pout=10000111
time=580 reset=0 m=10 clk=0 pin=10000110 sin_r=1 sin_l=1 pout=10000111
time=585 reset=0 m=10 clk=1 pin=10000110 sin_r=1 sin_l=1 pout=00001111
time=590 reset=0 m=10 clk=0 pin=10000110 sin_r=1 sin_l=0 pout=00001111
time=595 reset=0 m=10 clk=1 pin=10000110 sin_r=1 sin_l=0 pout=00011110
time=600 reset=0 m=11 clk=0 pin=00111100 sin_r=1 sin_l=0 pout=00011110
time=605 reset=0 m=11 clk=1 pin=00111100 sin_r=1 sin_l=0 pout=00111100
time=610 reset=0 m=10 clk=0 pin=00111100 sin_r=1 sin_l=1 pout=00111100
time=615 reset=0 m=10 clk=1 pin=00111100 sin_r=1 sin_l=1 pout=01111001
time=620 reset=0 m=00 clk=0 pin=00111100 sin_r=1 sin_l=1 pout=01111001
time=625 reset=0 m=00 clk=1 pin=00111100 sin_r=1 sin_l=1 pout=01111001
time=630 reset=0 m=10 clk=0 pin=00111100 sin_r=1 sin_l=1 pout=01111001
time=635 reset=0 m=10 clk=1 pin=00111100 sin_r=1 sin_l=1 pout=11110011
time=640 reset=0 m=01 clk=0 pin=00111100 sin_r=0 sin_l=1 pout=11110011
time=645 reset=0 m=01 clk=1 pin=00111100 sin_r=0 sin_l=1 pout=01111001
universal_shift_register_tb.v:38: $finish called at 650 (1ns)
time=650 reset=0 m=01 clk=0 pin=00111100 sin_r=1 sin_l=1 pout=01111001
* 
*/
