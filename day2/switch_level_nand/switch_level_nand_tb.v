module switch_level_nand_tb;
reg a,b;
wire y;
switch_level_nand d(a,b,y);
initial begin
	a=1'b0;b=1'b0;#5  
	a=1'b0;b=1'b1;#5 
	a=1'b1;b=1'b0;#5 
	a=1'b1;b=1'b1;#5
	a=1'b0;b=1'bx;#5
	a=1'b1;b=1'bx;#5
	a=1'b0;b=1'bz;#5
        a=1'b1;b=1'bx;#5
	$finish;
end
initial begin
	$monitor("@time=%0t in1=%b in2=%b out=%b",$time,a,b,y);
end
endmodule

/*
* OUTPUT
*@time=0 in1=0 in2=0 out=1
*@time=5 in1=0 in2=1 out=1
*@time=10 in1=1 in2=0 out=1
*@time=15 in1=1 in2=1 out=0
*@time=20 in1=0 in2=x out=1
*@time=25 in1=1 in2=x out=x
*@time=30 in1=0 in2=z out=1
*@time=35 in1=1 in2=x out=x
*switch_level_nand_tb.v:14: $finish called at 40 (1s)
* 
*/ 
