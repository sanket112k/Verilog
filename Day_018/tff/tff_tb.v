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
        t = $urandom_range(2'b00,2'b10);
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
                  15 clk=1 reset=0 t=0 q=0
                  20 clk=0 reset=0 t=0 q=0
                  24 clk=0 reset=0 t=1 q=0
                  25 clk=1 reset=0 t=1 q=1
                  28 clk=1 reset=1 t=1 q=1
                  30 clk=0 reset=1 t=0 q=1
                  33 clk=0 reset=1 t=1 q=1
                  34 clk=0 reset=0 t=1 q=1
                  35 clk=1 reset=0 t=1 q=0
                  36 clk=1 reset=0 t=0 q=0
                  40 clk=0 reset=0 t=0 q=0
                  45 clk=1 reset=0 t=1 q=1
                  50 clk=0 reset=0 t=1 q=1
                  51 clk=0 reset=0 t=0 q=1
                  55 clk=1 reset=0 t=0 q=1
tff_tb.v:14: $finish called at 60 (1s)
                  60 clk=0 reset=0 t=0 q=1
* 
*/
