module relational_operators();
reg [3:0]a,b;
wire [3:0]y;

assign y[3]=a<b;
assign y[2]=a>b;	
assign y[1]=a<=b;	
assign y[0]=a>=b;	

initial begin
	a=4'b0101;b=4'b1010;#5  
	a=4'b0011;b=4'b1100;#5 
	a=4'b0001;b=4'b0001;#5 
	a=4'b0001;b=4'b000x;#5
	a=4'b0001;b=4'bx001;#5
    a=4'b0001;b=4'b000z;#5
	a=4'b0001;b=4'bz001;#5
    a=4'bxxxx;b=4'bxxxx;#5
	a=4'bzzzz;b=4'bzzzz;#5
    a=4'bzzzz;b=4'bxxxx;#5
	$finish;
end
initial begin
	$monitor("a=%b b=%b   a<b=%b a>b=%b a<=b=%b a>=b=%b",a,b,y[3],y[2],y[1],y[0]);
end
endmodule

/*
* OUTPUT
a=0101 b=1010   a<b=1 a>b=0 a<=b=1 a>=b=0
a=0011 b=1100   a<b=1 a>b=0 a<=b=1 a>=b=0
a=0001 b=0001   a<b=0 a>b=0 a<=b=1 a>=b=1
a=0001 b=000x   a<b=x a>b=x a<=b=x a>=b=x
a=0001 b=x001   a<b=x a>b=x a<=b=x a>=b=x
a=0001 b=000z   a<b=x a>b=x a<=b=x a>=b=x
a=0001 b=z001   a<b=x a>b=x a<=b=x a>=b=x
a=xxxx b=xxxx   a<b=x a>b=x a<=b=x a>=b=x
a=zzzz b=zzzz   a<b=x a>b=x a<=b=x a>=b=x
a=zzzz b=xxxx   a<b=x a>b=x a<=b=x a>=b=x
relational_operators.v:21: $finish called at 50 (1s)

*  
*/ 
