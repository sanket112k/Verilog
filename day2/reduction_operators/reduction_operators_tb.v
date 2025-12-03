module reduction_operators_tb;
reg  [3:0]x;
wire [5:0]y;
reduction_operators a(x,y);
initial begin
	x=4'b0000;
	#5 x=4'b0101;
	#5 x=4'b0111;
    #5 x=4'b1111;
	#5 x=4'bx010;
	#5 x=4'bz101;
	#5 x=4'bx0z1;
	#5 $finish;
end

initial begin
	$monitor("x=%b | &x=%b ~&x=%b |x=%b ~|x=%b ^x=%b ~^x=%b",x[3:0],y[5],y[4],y[3],y[2],y[1],y[0],);
end

endmodule

/*
* OUTPUT
* x=0000 | &x=0 ~&x=1 |x=0 ~|x=1 ^x=0 ~^x=1 
* x=0101 | &x=0 ~&x=1 |x=1 ~|x=0 ^x=0 ~^x=1 
* x=0111 | &x=0 ~&x=1 |x=1 ~|x=0 ^x=1 ~^x=0 
* x=1111 | &x=1 ~&x=0 |x=1 ~|x=0 ^x=0 ~^x=1 
* x=x010 | &x=0 ~&x=1 |x=1 ~|x=0 ^x=x ~^x=x 
* x=z101 | &x=0 ~&x=1 |x=1 ~|x=0 ^x=x ~^x=x 
* x=x0z1 | &x=0 ~&x=1 |x=1 ~|x=0 ^x=x ~^x=x 
* reduction_operators_tb.v:13: $finish called at 35 (1s)
* 
*/
