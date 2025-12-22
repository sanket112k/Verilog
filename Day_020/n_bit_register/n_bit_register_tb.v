`timescale 1ns/1ns
module n_bit_register_tb;
parameter N=8;
reg clk;
reg reset;
reg load;
reg [N-1:0]pin;
wire [N-1:0]pout;
n_bit_register #(.N(N)) dut(clk, reset, load, pin, pout);
initial begin
    clk = 0;
    reset = 0;
    pin = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (5) begin
        @(negedge clk);
        #3;
        pin = $urandom_range({N{1'b0}},{N{1'b1}});
    end
    reset = 1; #25;
    reset = 0;
    repeat (5) begin
        @(negedge clk);
        #3;
        pin = $urandom_range({N{1'b0}},{N{1'b1}});
    end
    $finish;
end
initial begin
    load = 1; #40;
    load = 0; #10;
    load = 1;
end
initial begin
    $printtimescale;
    $monitor("t=%0t clk=%b reset=%b load=%b pin=%b pout=%b", $time, clk, reset, load, pin, pout);
    $dumpfile("n_bit_register.vcd");
    $dumpvars(0,n_bit_register_tb);
end
endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1gfddQadJEynC0nFPvjv_qReeHah9DZTy/view?usp=sharing
*
* OUTPUT
Time scale of (n_bit_register_tb) is 1ns / 1ns
VCD info: dumpfile n_bit_register.vcd opened for output.
t=0 clk=0 reset=0 load=1 pin=00000000 pout=xxxxxxxx
t=5 clk=1 reset=0 load=1 pin=00000000 pout=00000000
t=10 clk=0 reset=0 load=1 pin=00000000 pout=00000000
t=13 clk=0 reset=0 load=1 pin=10010010 pout=00000000
t=15 clk=1 reset=0 load=1 pin=10010010 pout=10010010
t=20 clk=0 reset=0 load=1 pin=10010010 pout=10010010
t=23 clk=0 reset=0 load=1 pin=01000000 pout=10010010
t=25 clk=1 reset=0 load=1 pin=01000000 pout=01000000
t=30 clk=0 reset=0 load=1 pin=01000000 pout=01000000
t=33 clk=0 reset=0 load=1 pin=00000100 pout=01000000
t=35 clk=1 reset=0 load=1 pin=00000100 pout=00000100
t=40 clk=0 reset=0 load=0 pin=00000100 pout=00000100
t=43 clk=0 reset=0 load=0 pin=00110001 pout=00000100
t=45 clk=1 reset=0 load=0 pin=00110001 pout=00000100
t=50 clk=0 reset=0 load=1 pin=00110001 pout=00000100
t=53 clk=0 reset=1 load=1 pin=10000110 pout=00000100
t=55 clk=1 reset=1 load=1 pin=10000110 pout=00000000
t=60 clk=0 reset=1 load=1 pin=10000110 pout=00000000
t=65 clk=1 reset=1 load=1 pin=10000110 pout=00000000
t=70 clk=0 reset=1 load=1 pin=10000110 pout=00000000
t=75 clk=1 reset=1 load=1 pin=10000110 pout=00000000
t=78 clk=1 reset=0 load=1 pin=10000110 pout=00000000
t=80 clk=0 reset=0 load=1 pin=10000110 pout=00000000
t=83 clk=0 reset=0 load=1 pin=11000110 pout=00000000
t=85 clk=1 reset=0 load=1 pin=11000110 pout=11000110
t=90 clk=0 reset=0 load=1 pin=11000110 pout=11000110
t=93 clk=0 reset=0 load=1 pin=00110010 pout=11000110
t=95 clk=1 reset=0 load=1 pin=00110010 pout=00110010
t=100 clk=0 reset=0 load=1 pin=00110010 pout=00110010
t=103 clk=0 reset=0 load=1 pin=00001001 pout=00110010
t=105 clk=1 reset=0 load=1 pin=00001001 pout=00001001
t=110 clk=0 reset=0 load=1 pin=00001001 pout=00001001
t=113 clk=0 reset=0 load=1 pin=10000000 pout=00001001
t=115 clk=1 reset=0 load=1 pin=10000000 pout=10000000
t=120 clk=0 reset=0 load=1 pin=10000000 pout=10000000
n_bit_register_tb.v:29: $finish called at 123 (1ns)
t=123 clk=0 reset=0 load=1 pin=10000110 pout=10000000

* 
*/
