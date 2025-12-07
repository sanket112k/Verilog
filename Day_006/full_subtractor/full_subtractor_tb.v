module full_subtractor_tb;
reg a,b,bin;
wire bout,diff;
full_subtractor dut(a,b,bin,bout,diff);
initial begin
    a=1'b0;b=1'b0;bin=1'b0;#5
    a=1'b0;b=1'b0;bin=1'b1;#5
    a=1'b0;b=1'b1;bin=1'b0;#5
    a=1'b0;b=1'b1;bin=1'b1;#5
    a=1'b1;b=1'b0;bin=1'b0;#5
    a=1'b1;b=1'b0;bin=1'b1;#5
    a=1'b1;b=1'b1;bin=1'b0;#5
    a=1'b1;b=1'b1;bin=1'b1;#5
    $finish;
end
initial begin
    $monitor("a=%b b=%b bin=%b diff=%b bout=%b",a,b,bin,diff,bout);
end
endmodule

/*
* OUTPUT
a=0 b=0 bin=0 diff=0 bout=0
a=0 b=0 bin=1 diff=1 bout=1
a=0 b=1 bin=0 diff=1 bout=1
a=0 b=1 bin=1 diff=0 bout=1
a=1 b=0 bin=0 diff=1 bout=0
a=1 b=0 bin=1 diff=0 bout=0
a=1 b=1 bin=0 diff=0 bout=0
a=1 b=1 bin=1 diff=1 bout=1
full_subtractor_tb.v:14: $finish called at 40 (1s)
* 
*/
