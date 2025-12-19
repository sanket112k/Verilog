module sr_latch_tb;
reg en;
reg s,r;
wire q;
sr_latch dut(en,s,r,q);
initial begin
    en = 0; {s,r} = 0;
    forever #5 en = ~en;
end
initial begin
    repeat (20) begin
        {s,r} = $urandom_range(2'b00,2'b10);
        #3;
    end
    $finish;
end
initial begin
    $monitor("Time=%0t:  en=%b, s=%b r=%b -> q=%b", $time, en, s, r, q);
    $dumpfile("sr_latch.vcd");
    $dumpvars(0, sr_latch_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile sr_latch.vcd opened for output.
Time=0:  en=0, s=0 r=1 -> q=x
Time=3:  en=0, s=0 r=0 -> q=x
Time=5:  en=1, s=0 r=0 -> q=x
Time=10:  en=0, s=0 r=0 -> q=x
Time=12:  en=0, s=0 r=1 -> q=x
Time=15:  en=1, s=1 r=0 -> q=1
Time=18:  en=1, s=0 r=0 -> q=1
Time=20:  en=0, s=0 r=0 -> q=1
Time=24:  en=0, s=0 r=1 -> q=1
Time=25:  en=1, s=0 r=1 -> q=0
Time=30:  en=0, s=1 r=0 -> q=0
Time=33:  en=0, s=0 r=1 -> q=0
Time=35:  en=1, s=0 r=1 -> q=0
Time=36:  en=1, s=1 r=0 -> q=1
Time=40:  en=0, s=1 r=0 -> q=1
Time=45:  en=1, s=0 r=1 -> q=0
Time=50:  en=0, s=0 r=1 -> q=0
Time=51:  en=0, s=0 r=0 -> q=0
Time=54:  en=0, s=1 r=0 -> q=0
Time=55:  en=1, s=1 r=0 -> q=1
Time=57:  en=1, s=0 r=0 -> q=1
sr_latch_tb.v:15: $finish called at 60 (1s)
Time=60:  en=0, s=0 r=0 -> q=1
* 
*/
