module arithmetic_operators;
integer x,y,z;
initial begin
	x=17;
	y=8;
	z=x+y;
	$display("a=%0d b=%0d a+b=%0d",x,y,z);
	z=x-y;
	$display("a=%0d b=%0d a-b=%0d",x,y,z);
	z=x*y;
	$display("a=%0d b=%0d axb=%0d",x,y,z);
	z=x/y;
	$display("a=%0d b=%0d a/b=%0d",x,y,z);
	z=x%y;
	$display("a=%0d b=%0d a%%b=%0d",x,y,z);
	z=+y;
	$display("b=%0d Unary plus +b=%0d",y,z);
	z=-y;
	$display("b=%0d Unaru minus -b=%0d",y,z);
end
endmodule

/*
* a=17 b=8 a+b=25
* a=17 b=8 a-b=9
* a=17 b=8 axb=136
* a=17 b=8 a/b=2
* a=17 b=8 a%b=1
* b=8 Unary plus +b=8
* b=8 Unaru minus -b=-8
*/
