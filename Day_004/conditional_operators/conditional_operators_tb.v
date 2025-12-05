module conditional_operators_tb;
reg [3:0]x;
wire y;
conditional_operators d0(x,y);
initial begin
	$monitor("in=%b out=%b //out is 0 for even and 1 for odd",x,y);
	x=4'b0101;
	#5 x=4'b1010;
	#5 $finish;
end
endmodule

/*
* OUTPUT
* in=0101 out=1 //out is 0 for even and 1 for odd
* in=1010 out=0 //out is 0 for even and 1 for odd
* conditional_operators_tb.v:9: $finish called at 10 (1s)
* /
