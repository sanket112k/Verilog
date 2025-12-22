module tff_tb;
reg clk,reset,t;
wire q;
tff dut(clk,reset,t,q);
initial begin
    clk = 0; t = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (20) begin
        t = $urandom_range(1'b0,1'b1);
        #3;
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
    $dumpfile("tff.vcd");
    $dumpvars(0,tff_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile tff.vcd opened for output.
                   0 clk=0 reset=1 t=1 q=x
                   3 clk=0 reset=1 t=0 q=x
                   5 clk=1 reset=1 t=0 q=0
                   6 clk=1 reset=0 t=0 q=0
                  10 clk=0 reset=0 t=0 q=0
                  12 clk=0 reset=0 t=1 q=0
                  15 clk=1 reset=0 t=1 q=1
                  18 clk=1 reset=0 t=0 q=1
                  20 clk=0 reset=0 t=0 q=1
                  24 clk=0 reset=0 t=1 q=1
                  25 clk=1 reset=0 t=1 q=0
                  28 clk=1 reset=1 t=1 q=0
                  30 clk=0 reset=1 t=1 q=0
                  34 clk=0 reset=0 t=1 q=0
                  35 clk=1 reset=0 t=1 q=1
                  40 clk=0 reset=0 t=1 q=1
                  45 clk=1 reset=0 t=0 q=1
                  50 clk=0 reset=0 t=0 q=1
                  54 clk=0 reset=0 t=1 q=1
                  55 clk=1 reset=0 t=1 q=0
                  57 clk=1 reset=0 t=0 q=0
tff_tb.v:14: $finish called at 60 (1s)
                  60 clk=0 reset=0 t=0 q=0
* 
*/
