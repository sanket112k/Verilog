module bitwise_operators_tb;
reg [3:0]a;
reg [3:0]b;
wire [19:0]y;
bitwise_operators d(a,b,y);
initial begin
	$monitor("a=%b b=%b | ~a=%b | a&b=%b | a|b=%b | a^b=%b | a~^b=%b",a,b,y[19:16],y[15:12],y[11:8],y[7:4],y[3:0]);
	a=4'b0001;b=4'b0001;#5  
	a=4'b1001;b=4'b1001;#5 
	a=4'bx001;b=4'b1011;#5
        a=4'bx001;b=4'b0011;#5	
	a=4'bz001;b=4'b1111;#5
	a=4'bz001;b=4'b0011;#5
	$finish;
end
endmodule

/*
* a=0001 b=0001 | ~a=1110 | a&b=0001 | a|b=0001 | a^b=0000 | a~^b=1111
* a=1001 b=1001 | ~a=0110 | a&b=1001 | a|b=1001 | a^b=0000 | a~^b=1111
* a=x001 b=1011 | ~a=x110 | a&b=x001 | a|b=1011 | a^b=x010 | a~^b=x101
* a=x001 b=0011 | ~a=x110 | a&b=0001 | a|b=x011 | a^b=x010 | a~^b=x101
* a=z001 b=1111 | ~a=x110 | a&b=x001 | a|b=1111 | a^b=x110 | a~^b=x001
* a=z001 b=0011 | ~a=x110 | a&b=0001 | a|b=x011 | a^b=x010 | a~^b=x101
* bitwise_operators_tb.v:14: $finish called at 30 (1s)
*/
