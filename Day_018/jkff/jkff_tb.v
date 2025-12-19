module jkff_tb;
reg clk, reset, j, k;
wire q;
jkff dut(clk, reset, j, k, q);
initial begin
    clk = 0; {j,k} = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (20) begin
        {j,k} = $urandom_range(2'b00,2'b11);
        #3;
    end
    $finish;
end
initial begin
    reset = 0; #28;
    reset = 1; #10;
    reset = 0;
end
initial begin
    $monitor($time," clk=%b reset=%b j=%b k=%b q=%b", clk, reset, j, k, q);
    $dumpfile("jkff.vcd");
    $dumpvars(0,jkff_tb);
end
endmodule

/*
* OUTPUT
CD info: dumpfile jkff.vcd opened for output.
                   0 clk=0 reset=0 j=1 k=0 q=x
                   3 clk=0 reset=0 j=0 k=1 q=x
                   5 clk=1 reset=0 j=0 k=1 q=0
                   6 clk=1 reset=0 j=0 k=0 q=0
                  10 clk=0 reset=0 j=0 k=0 q=0
                  12 clk=0 reset=0 j=1 k=0 q=0
                  15 clk=1 reset=0 j=1 k=1 q=1
                  18 clk=1 reset=0 j=0 k=0 q=1
                  20 clk=0 reset=0 j=0 k=0 q=1
                  24 clk=0 reset=0 j=1 k=0 q=1
                  25 clk=1 reset=0 j=1 k=0 q=1
                  28 clk=1 reset=1 j=1 k=0 q=1
                  30 clk=0 reset=1 j=1 k=0 q=1
                  35 clk=1 reset=1 j=1 k=0 q=0
                  36 clk=1 reset=1 j=1 k=1 q=0
                  38 clk=1 reset=0 j=1 k=1 q=0
                  40 clk=0 reset=0 j=1 k=1 q=0
                  45 clk=1 reset=0 j=0 k=1 q=0
                  50 clk=0 reset=0 j=0 k=1 q=0
                  54 clk=0 reset=0 j=1 k=1 q=0
                  55 clk=1 reset=0 j=1 k=1 q=1
                  57 clk=1 reset=0 j=0 k=0 q=1
jkff_tb.v:14: $finish called at 60 (1s)
                  60 clk=0 reset=0 j=0 k=0 q=1
* 
*/
