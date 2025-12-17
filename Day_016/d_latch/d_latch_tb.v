module d_latch_tb;
reg en;
reg d;
wire q;
d_latch dut(en,d,q);
initial begin
    en = 0; d = 0; #10; 

    en = 1; #5;  d = 1; #5; d = 0; #5;

    en = 0; #10; d = 1; #5; 
    en = 1; #5;  d = 0; #5; 

    en = 1; #5;  d = 1; #5; 
    en = 0; #10; d = 0; #5;
    $finish;
end
initial begin
    $monitor("Time=%0t:  en=%b, d=%b -> q=%b", $time, en, d, q);
    $dumpfile("d_latch.vcd");
    $dumpvars(0, d_latch_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile d_latch.vcd opened for output.
Time=0:  en=0, d=0 -> q=x
Time=10:  en=1, d=0 -> q=0
Time=15:  en=1, d=1 -> q=1
Time=20:  en=1, d=0 -> q=0
Time=25:  en=0, d=0 -> q=0
Time=35:  en=0, d=1 -> q=0
Time=40:  en=1, d=1 -> q=1
Time=45:  en=1, d=0 -> q=0
Time=55:  en=1, d=1 -> q=1
Time=60:  en=0, d=1 -> q=1
Time=70:  en=0, d=0 -> q=1
d_latch_tb.v:16: $finish called at 75 (1s)
* 
*/
