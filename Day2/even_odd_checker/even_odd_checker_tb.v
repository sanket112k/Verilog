module even_odd_checker_tb;
reg [3:0]x;
wire y;
even_odd_checker d0(x,y);
initial begin
	$monitor("in=%b out=%b //out is 0 for even and 1 for odd",x,y);
	x=4'b0101;
	#5 x=4'b1010;
	#5 $finish;
end
endmodule

/*
* in=0101 out=1 //out is 0 for even and 1 for odd
* in=1010 out=0 //out is 0 for even and 1 for odd
* even_odd_checker_tb.v:9: $finish called at 10 (1s)
* /
