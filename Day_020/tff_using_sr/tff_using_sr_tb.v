module tff_using_sr_tb;
reg clk,reset,t;
wire q;
tff_using_sr dut(clk,reset,t,q);
initial begin
    clk = 0; t = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (20) begin
        @(negedge clk);
        t = $urandom_range(1'b0,1'b1);
    end
    $finish;
end
initial begin
    reset = 1; #6;
    reset = 0; #22;
    reset = 1; #6;
    reset = 0;
end
initial begin
    $monitor($time," clk=%b reset=%b t=%b q=%b", clk, reset, t, q);
    $dumpfile("tff_using_sr.vcd");
    $dumpvars(0,tff_using_sr_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1JcgE8oYkcWR88I08-mmhGUBSW1aQ6KcN/view?usp=sharing
*
* OUTPUT
VCD info: dumpfile tff_using_sr.vcd opened for output.
                   0 clk=0 reset=1 t=0 q=x
                   5 clk=1 reset=1 t=0 q=0
                   6 clk=1 reset=0 t=0 q=0
                  10 clk=0 reset=0 t=1 q=0
                  15 clk=1 reset=0 t=1 q=1
                  20 clk=0 reset=0 t=0 q=1
                  25 clk=1 reset=0 t=0 q=1
                  28 clk=1 reset=1 t=0 q=1
                  30 clk=0 reset=1 t=0 q=1
                  34 clk=0 reset=0 t=0 q=1
                  35 clk=1 reset=0 t=0 q=1
                  40 clk=0 reset=0 t=0 q=1
                  45 clk=1 reset=0 t=0 q=1
                  50 clk=0 reset=0 t=1 q=1
                  55 clk=1 reset=0 t=1 q=0
                  60 clk=0 reset=0 t=1 q=0
                  65 clk=1 reset=0 t=1 q=1
                  70 clk=0 reset=0 t=0 q=1
                  75 clk=1 reset=0 t=0 q=1
                  80 clk=0 reset=0 t=0 q=1
                  85 clk=1 reset=0 t=0 q=1
                  90 clk=0 reset=0 t=1 q=1
                  95 clk=1 reset=0 t=1 q=0
                 100 clk=0 reset=0 t=1 q=0
                 105 clk=1 reset=0 t=1 q=1
                 110 clk=0 reset=0 t=1 q=1
                 115 clk=1 reset=0 t=1 q=0
                 120 clk=0 reset=0 t=1 q=0
                 125 clk=1 reset=0 t=1 q=1
                 130 clk=0 reset=0 t=1 q=1
                 135 clk=1 reset=0 t=1 q=0
                 140 clk=0 reset=0 t=1 q=0
                 145 clk=1 reset=0 t=1 q=1
                 150 clk=0 reset=0 t=1 q=1
                 155 clk=1 reset=0 t=1 q=0
                 160 clk=0 reset=0 t=0 q=0
                 165 clk=1 reset=0 t=0 q=0
                 170 clk=0 reset=0 t=0 q=0
                 175 clk=1 reset=0 t=0 q=0
                 180 clk=0 reset=0 t=0 q=0
                 185 clk=1 reset=0 t=0 q=0
                 190 clk=0 reset=0 t=1 q=0
                 195 clk=1 reset=0 t=1 q=1
tff_using_sr_tb.v:14: $finish called at 200 (1s)
                 200 clk=0 reset=0 t=0 q=1
*
* 
*/
