module srff_tb;
reg clk,reset,s,r;
wire q;
srff dut(clk,reset,s,r,q);
initial begin
    clk = 0; {s,r} = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (20) begin
        {s,r} = $urandom_range(2'b00,2'b10);
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
    $monitor($time," clk=%b reset=%b s=%b r=%b q=%b", clk, reset, s, r, q);
    $dumpfile("srff.vcd");
    $dumpvars(0,srff_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile srff.vcd opened for output.
                   0 clk=0 reset=0 s=0 r=1 q=x
                   3 clk=0 reset=0 s=0 r=0 q=x
                   5 clk=1 reset=0 s=0 r=0 q=x
                  10 clk=0 reset=0 s=0 r=0 q=x
                  12 clk=0 reset=0 s=0 r=1 q=x
                  15 clk=1 reset=0 s=1 r=0 q=1
                  18 clk=1 reset=0 s=0 r=0 q=1
                  20 clk=0 reset=0 s=0 r=0 q=1
                  24 clk=0 reset=0 s=0 r=1 q=1
                  25 clk=1 reset=0 s=0 r=1 q=0
                  28 clk=1 reset=1 s=0 r=1 q=0
                  30 clk=0 reset=1 s=1 r=0 q=0
                  33 clk=0 reset=1 s=0 r=1 q=0
                  35 clk=1 reset=1 s=0 r=1 q=0
                  36 clk=1 reset=1 s=1 r=0 q=0
                  38 clk=1 reset=0 s=1 r=0 q=0
                  40 clk=0 reset=0 s=1 r=0 q=0
                  45 clk=1 reset=0 s=0 r=1 q=0
                  50 clk=0 reset=0 s=0 r=1 q=0
                  51 clk=0 reset=0 s=0 r=0 q=0
                  54 clk=0 reset=0 s=1 r=0 q=0
                  55 clk=1 reset=0 s=1 r=0 q=1
                  57 clk=1 reset=0 s=0 r=0 q=1
srff_tb.v:14: $finish called at 60 (1s)
                  60 clk=0 reset=0 s=0 r=0 q=1
* 
*/
