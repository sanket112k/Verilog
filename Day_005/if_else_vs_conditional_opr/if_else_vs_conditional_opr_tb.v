module if_else_vs_conditional_opr_tb;
reg a,b;
wire y;
wire z;
if_else_vs_conditional_opr dut(a,b,y,z);
initial begin
	a=1'b0;b=1'b0;#5
    a=1'b0;b=1'b1;#5
    a=1'b1;b=1'b0;#5
    a=1'b1;b=1'b1;#5
    a=1'b0;b=1'bx;#5
    a=1'b1;b=1'bx;#5
    a=1'b0;b=1'bz;#5
    a=1'b1;b=1'bz;#5
    a=1'bx;b=1'bz;#5
    $finish;
end

initial begin
	$monitor("a=%b b=%b AND_using_if_else=%b AND_using_conditional_opr=%b",a,b,y,z);
end
endmodule

/*
* OUTPUT
a=0 b=0 AND_using_if_else=0 AND_using_conditional_opr=0
a=0 b=1 AND_using_if_else=0 AND_using_conditional_opr=0
a=1 b=0 AND_using_if_else=0 AND_using_conditional_opr=0
a=1 b=1 AND_using_if_else=1 AND_using_conditional_opr=1
a=0 b=x AND_using_if_else=0 AND_using_conditional_opr=0
a=1 b=x AND_using_if_else=0 AND_using_conditional_opr=x
a=0 b=z AND_using_if_else=0 AND_using_conditional_opr=0
a=1 b=z AND_using_if_else=0 AND_using_conditional_opr=x
a=x b=z AND_using_if_else=0 AND_using_conditional_opr=x
if_else_vs_conditional_opr_tb.v:16: $finish called at 45 (1s)
* 
*/
