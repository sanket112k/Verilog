module dff_async_reset_tb;
reg clk,d,reset;
wire q;
dff_async_reset dut(clk,d,reset,q);
initial begin
    clk = 0; d = 0; reset = 0;
    forever #5 clk = ~clk;
end
initial begin
    #5 reset = 0;
    repeat (6) begin
        d = $urandom_range(0,1);
        #3;
    end
    reset = 1; #3;
    reset = 0;
    repeat (6) begin
        d = $urandom_range(0,1);
        #3;
    end
    $finish;
end
initial begin
    $monitor($time," clk=%b reset=%b d=%b q=%b", clk, reset, d, q);
    $dumpfile("dff_async_reset.vcd");
    $dumpvars(0,dff_async_reset_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile dff_async_reset.vcd opened for output.
                   0 clk=0 reset=0 d=0 q=x
                   5 clk=1 reset=0 d=1 q=1
                   8 clk=1 reset=0 d=0 q=1
                  10 clk=0 reset=0 d=0 q=1
                  15 clk=1 reset=0 d=0 q=0
                  17 clk=1 reset=0 d=1 q=0
                  20 clk=0 reset=0 d=1 q=0
                  23 clk=0 reset=1 d=1 q=0
                  25 clk=1 reset=1 d=1 q=0
                  26 clk=1 reset=0 d=0 q=0
                  30 clk=0 reset=0 d=0 q=0
                  32 clk=0 reset=0 d=1 q=0
                  35 clk=1 reset=0 d=1 q=1
                  40 clk=0 reset=0 d=1 q=1
dff_async_reset_tb.v:21: $finish called at 44 (1s)
* 
*/
