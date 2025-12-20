`timescale 1ns/1ns
module sipo_tb;
reg clk;
reg sin;
reg reset;
wire [3:0]pout;
sipo dut(clk, sin, reset, pout);
initial begin
    clk = 0;
    reset = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (20) begin
        sin = $urandom_range(0,1);
        #3;
    end
    reset = 1; #3;
    reset = 0;
    repeat (20) begin
        sin = $urandom_range(0,1);
        #3;
    end
    $finish;
end
initial begin
    $printtimescale;
    $monitor($time,"clk=%b reset=%b sin=%b pout3=%b pout2=%b pout1=%b pout0=%b", clk, reset, sin, pout[3], pout[2], pout[1], pout[0]);
    $dumpfile("sipo.vcd");
    $dumpvars(0,sipo_tb);
end
endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1koGqxR2__PNNLjXDmV87HpFsNCO1BPNm/view?usp=sharing
*
* OUTPUT
Time scale of (sipo_tb) is 1ns / 1ns
VCD info: dumpfile sipo.vcd opened for output.
                   0clk=0 reset=0 sin=1 pout3=x pout2=x pout1=x pout0=x
                   3clk=0 reset=0 sin=0 pout3=x pout2=x pout1=x pout0=x
                   5clk=1 reset=0 sin=0 pout3=0 pout2=x pout1=x pout0=x
                  10clk=0 reset=0 sin=0 pout3=0 pout2=x pout1=x pout0=x
                  12clk=0 reset=0 sin=1 pout3=0 pout2=x pout1=x pout0=x
                  15clk=1 reset=0 sin=1 pout3=1 pout2=0 pout1=x pout0=x
                  18clk=1 reset=0 sin=0 pout3=1 pout2=0 pout1=x pout0=x
                  20clk=0 reset=0 sin=0 pout3=1 pout2=0 pout1=x pout0=x
                  24clk=0 reset=0 sin=1 pout3=1 pout2=0 pout1=x pout0=x
                  25clk=1 reset=0 sin=1 pout3=1 pout2=1 pout1=0 pout0=x
                  30clk=0 reset=0 sin=1 pout3=1 pout2=1 pout1=0 pout0=x
                  35clk=1 reset=0 sin=1 pout3=1 pout2=1 pout1=1 pout0=0
                  40clk=0 reset=0 sin=1 pout3=1 pout2=1 pout1=1 pout0=0
                  45clk=1 reset=0 sin=0 pout3=0 pout2=1 pout1=1 pout0=1
                  50clk=0 reset=0 sin=0 pout3=0 pout2=1 pout1=1 pout0=1
                  54clk=0 reset=0 sin=1 pout3=0 pout2=1 pout1=1 pout0=1
                  55clk=1 reset=0 sin=1 pout3=1 pout2=0 pout1=1 pout0=1
                  57clk=1 reset=0 sin=0 pout3=1 pout2=0 pout1=1 pout0=1
                  60clk=0 reset=1 sin=0 pout3=1 pout2=0 pout1=1 pout0=1
                  63clk=0 reset=0 sin=0 pout3=1 pout2=0 pout1=1 pout0=1
                  65clk=1 reset=0 sin=0 pout3=0 pout2=1 pout1=0 pout0=1
                  66clk=1 reset=0 sin=1 pout3=0 pout2=1 pout1=0 pout0=1
                  70clk=0 reset=0 sin=1 pout3=0 pout2=1 pout1=0 pout0=1
                  72clk=0 reset=0 sin=0 pout3=0 pout2=1 pout1=0 pout0=1
                  75clk=1 reset=0 sin=0 pout3=0 pout2=0 pout1=1 pout0=0
                  80clk=0 reset=0 sin=0 pout3=0 pout2=0 pout1=1 pout0=0
                  81clk=0 reset=0 sin=1 pout3=0 pout2=0 pout1=1 pout0=0
                  84clk=0 reset=0 sin=0 pout3=0 pout2=0 pout1=1 pout0=0
                  85clk=1 reset=0 sin=0 pout3=0 pout2=0 pout1=0 pout0=1
                  90clk=0 reset=0 sin=0 pout3=0 pout2=0 pout1=0 pout0=1
                  95clk=1 reset=0 sin=0 pout3=0 pout2=0 pout1=0 pout0=0
                  96clk=1 reset=0 sin=1 pout3=0 pout2=0 pout1=0 pout0=0
                  99clk=1 reset=0 sin=0 pout3=0 pout2=0 pout1=0 pout0=0
                 100clk=0 reset=0 sin=0 pout3=0 pout2=0 pout1=0 pout0=0
                 102clk=0 reset=0 sin=1 pout3=0 pout2=0 pout1=0 pout0=0
                 105clk=1 reset=0 sin=1 pout3=1 pout2=0 pout1=0 pout0=0
                 108clk=1 reset=0 sin=0 pout3=1 pout2=0 pout1=0 pout0=0
                 110clk=0 reset=0 sin=0 pout3=1 pout2=0 pout1=0 pout0=0
                 115clk=1 reset=0 sin=0 pout3=0 pout2=1 pout1=0 pout0=0
                 120clk=0 reset=0 sin=0 pout3=0 pout2=1 pout1=0 pout0=0
sipo_tb.v:24: $finish called at 123 (1ns)
* 
*/
