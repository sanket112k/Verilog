module logical_operators();
reg a,b;
wire [2:0]y;

assign y[2]=a&&b;	
assign y[1]=a||b;	
assign y[0]=!b;	

initial begin
	a=1'b0;b=1'b0;#5  
	a=1'b0;b=1'b1;#5 
	a=1'b1;b=1'b0;#5 
	a=1'b1;b=1'b1;#5
	a=1'b0;b=1'bx;#5
	a=1'b1;b=1'bx;#5
	a=1'bx;b=1'b0;#5
	a=1'bx;b=1'b1;#5
    a=1'bx;b=1'bx;#5
	a=1'b0;b=1'bz;#5
    a=1'b1;b=1'bz;#5
    a=1'bz;b=1'b0;#5
    a=1'bz;b=1'b1;#5
	a=1'bz;b=1'bz;#5 
	$finish;
end
initial begin
	$monitor("a=%b b=%b   a&&b=%b a||b=%b !b=%b",a,b,y[2],y[1],y[0]);
end
endmodule

/*
* OUTPUT
a=0 b=0   a&&b=0 a||b=0 !b=1
a=0 b=1   a&&b=0 a||b=1 !b=0
a=1 b=0   a&&b=0 a||b=1 !b=1
a=1 b=1   a&&b=1 a||b=1 !b=0
a=0 b=x   a&&b=0 a||b=x !b=x
a=1 b=x   a&&b=x a||b=1 !b=x
a=x b=0   a&&b=0 a||b=x !b=1
a=x b=1   a&&b=x a||b=1 !b=0
a=x b=x   a&&b=x a||b=x !b=x
a=0 b=z   a&&b=0 a||b=x !b=x
a=1 b=z   a&&b=x a||b=1 !b=x
a=z b=0   a&&b=0 a||b=x !b=1
a=z b=1   a&&b=x a||b=1 !b=0
a=z b=z   a&&b=x a||b=x !b=x
logical_operators.v:24: $finish called at 70 (1s)
*  
*/ 
