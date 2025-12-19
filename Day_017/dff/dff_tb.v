module dff_tb;
reg clk,d;
wire q;
dff dut(clk,d,q);
initial begin
    clk = 0; d = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (10) begin
        d = $urandom_range(0,1);
        #5;
    end
    $finish;
end
initial begin
    $monitor($time," clk=%b d=%b q=%b",clk,d,q);
    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile dff.vcd opened for output.
                   0 clk=0 d=1 q=x
                   5 clk=1 d=0 q=0
                  10 clk=0 d=0 q=0
                  15 clk=1 d=0 q=0
                  20 clk=0 d=1 q=0
                  25 clk=1 d=1 q=1
                  30 clk=0 d=0 q=1
                  35 clk=1 d=0 q=0
                  40 clk=0 d=1 q=0
                  45 clk=1 d=1 q=1
dff_tb.v:14: $finish called at 50 (1s)
* 
*/
