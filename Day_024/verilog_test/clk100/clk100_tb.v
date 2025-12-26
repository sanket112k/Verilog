module clk100_tb;
reg clk, rst;
wire out;

clk100 dut(clk,rst,out);

always #10 clk = ~clk;
initial begin
    clk = 0;
    rst = 0;
    repeat(20) @(posedge clk);
    rst = 1;
    repeat(2) @(posedge clk);
    rst = 0;
    repeat(5_000_000) @(posedge clk);
    $finish;
end
initial begin
    $monitor("rst=%b led=%b",rst,out);
    $dumpfile("clk100.vcd");
    $dumpvars(0,clk100_tb);
end
endmodule

/*
VCD info: dumpfile clk100.vcd opened for output.
rst=0 led=x
rst=0 led=0
rst=1 led=0
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
rst=0 led=0
rst=0 led=1
clk100_tb.v:16: $finish called at 100000430 (1s)
* */
