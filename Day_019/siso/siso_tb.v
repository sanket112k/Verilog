`timescale 1ns/1ns
module siso_tb;
reg clk;
reg sin;
reg reset;
wire sout;
siso dut(clk, sin, reset, sout);
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
    $monitor($time,"clk=%b reset=%b sin=%b sout=%b", clk, reset, sin, sout);
    $dumpfile("siso.vcd");
    $dumpvars(0,siso_tb);
end
endmodule



/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1rDoP2LO7Fj3oOrW2IvtnffaSx8LK9JYh/view?usp=sharing
*
* OUTPUT
Time scale of (siso_tb) is 1ns / 1ns
VCD info: dumpfile siso.vcd opened for output.
                   0clk=0 reset=0 sin=1 sout=x
                   3clk=0 reset=0 sin=0 sout=x
                   5clk=1 reset=0 sin=0 sout=x
                  10clk=0 reset=0 sin=0 sout=x
                  12clk=0 reset=0 sin=1 sout=x
                  15clk=1 reset=0 sin=1 sout=x
                  18clk=1 reset=0 sin=0 sout=x
                  20clk=0 reset=0 sin=0 sout=x
                  24clk=0 reset=0 sin=1 sout=x
                  25clk=1 reset=0 sin=1 sout=x
                  30clk=0 reset=0 sin=1 sout=x
                  35clk=1 reset=0 sin=1 sout=0
                  40clk=0 reset=0 sin=1 sout=0
                  45clk=1 reset=0 sin=0 sout=1
                  50clk=0 reset=0 sin=0 sout=1
                  54clk=0 reset=0 sin=1 sout=1
                  55clk=1 reset=0 sin=1 sout=1
                  57clk=1 reset=0 sin=0 sout=1
                  60clk=0 reset=1 sin=0 sout=1
                  63clk=0 reset=0 sin=0 sout=1
                  65clk=1 reset=0 sin=0 sout=1
                  66clk=1 reset=0 sin=1 sout=1
                  70clk=0 reset=0 sin=1 sout=1
                  72clk=0 reset=0 sin=0 sout=1
                  75clk=1 reset=0 sin=0 sout=0
                  80clk=0 reset=0 sin=0 sout=0
                  81clk=0 reset=0 sin=1 sout=0
                  84clk=0 reset=0 sin=0 sout=0
                  85clk=1 reset=0 sin=0 sout=1
                  90clk=0 reset=0 sin=0 sout=1
                  95clk=1 reset=0 sin=0 sout=0
                  96clk=1 reset=0 sin=1 sout=0
                  99clk=1 reset=0 sin=0 sout=0
                 100clk=0 reset=0 sin=0 sout=0
                 102clk=0 reset=0 sin=1 sout=0
                 105clk=1 reset=0 sin=1 sout=0
                 108clk=1 reset=0 sin=0 sout=0
                 110clk=0 reset=0 sin=0 sout=0
                 115clk=1 reset=0 sin=0 sout=0
                 120clk=0 reset=0 sin=0 sout=0
siso_tb.v:24: $finish called at 123 (1ns)
* 
*/
