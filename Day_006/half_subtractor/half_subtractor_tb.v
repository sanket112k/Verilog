module half_subtractor_tb;
reg a,b;
wire diff;
half_subtractor dut(a,b,diff);
initial begin
    a=1'b0;b=1'b0;#5
    a=1'b0;b=1'b1;#5
    a=1'b1;b=1'b0;#5
    a=1'b1;b=1'b1;#5
    $finish;
end
initial begin
    $monitor("a=%b b=%b diff=%b",a,b,diff);
end
endmodule

/*
* OUTPUT
a=0 b=0 diff=0
a=0 b=1 diff=1
a=1 b=0 diff=1
a=1 b=1 diff=0
half_subtractor_tb.v:10: $finish called at 20 (1s)
* 
*/
