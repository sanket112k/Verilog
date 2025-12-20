`timescale 1ns/1ns
module pipo_tb;
reg clk;
reg reset;
reg load;
reg [3:0]pin;
wire [3:0]pout;
pipo dut(clk, reset, load, pin, pout);
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
        pin = $urandom_range(4'h1,4'hf);
    end
    reset = 1; #25;
    reset = 0;
    repeat (5) begin
        @(negedge clk);
        #3;
        pin = $urandom_range(4'h1,4'hf);
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
    $monitor("t=%0t clk=%b reset=%b load=%b pin3=%b pin2=%b pin1=%b pin0=%b pout3=%b pout2=%b pout1=%b pout0=%b", $time, clk, reset, load, pin[3], pin[2], pin[1], pin[0], pout[3], pout[2], pout[1], pout[0]);
    $dumpfile("pipo.vcd");
    $dumpvars(0,pipo_tb);
end
endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1k4KpvDJns7FaWrE_yKzPBfja9mm8gAkh/view?usp=sharing
*
* OUTPUT
Time scale of (pipo_tb) is 1ns / 1ns
VCD info: dumpfile pipo.vcd opened for output.
t=0 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=0 pout3=x pout2=x pout1=x pout0=x
t=5 clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=10 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=13 clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=0 pout0=0
t=15 clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=1 pout3=1 pout2=0 pout1=0 pout0=1
t=20 clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=1 pout3=1 pout2=0 pout1=0 pout0=1
t=23 clk=0 reset=0 load=1 pin3=0 pin2=1 pin1=0 pin0=0 pout3=1 pout2=0 pout1=0 pout0=1
t=25 clk=1 reset=0 load=1 pin3=0 pin2=1 pin1=0 pin0=0 pout3=0 pout2=1 pout1=0 pout0=0
t=30 clk=0 reset=0 load=1 pin3=0 pin2=1 pin1=0 pin0=0 pout3=0 pout2=1 pout1=0 pout0=0
t=33 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=1 pout1=0 pout0=0
t=35 clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=40 clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=43 clk=0 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=45 clk=1 reset=0 load=0 pin3=0 pin2=0 pin1=1 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=50 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=53 clk=0 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=1
t=55 clk=1 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=60 clk=0 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=65 clk=1 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=70 clk=0 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=75 clk=1 reset=1 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=78 clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=80 clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=83 clk=0 reset=0 load=1 pin3=1 pin2=1 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=0
t=85 clk=1 reset=0 load=1 pin3=1 pin2=1 pin1=0 pin0=0 pout3=1 pout2=1 pout1=0 pout0=0
t=90 clk=0 reset=0 load=1 pin3=1 pin2=1 pin1=0 pin0=0 pout3=1 pout2=1 pout1=0 pout0=0
t=93 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 pout3=1 pout2=1 pout1=0 pout0=0
t=95 clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 pout3=0 pout2=0 pout1=1 pout0=1
t=100 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=1 pin0=1 pout3=0 pout2=0 pout1=1 pout0=1
t=103 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=1 pout0=1
t=105 clk=1 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=110 clk=0 reset=0 load=1 pin3=0 pin2=0 pin1=0 pin0=1 pout3=0 pout2=0 pout1=0 pout0=1
t=113 clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=0 pout2=0 pout1=0 pout0=1
t=115 clk=1 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=1 pout2=0 pout1=0 pout0=0
t=120 clk=0 reset=0 load=1 pin3=1 pin2=0 pin1=0 pin0=0 pout3=1 pout2=0 pout1=0 pout0=0
pipo_tb.v:28: $finish called at 123 (1ns)
* 
*/
