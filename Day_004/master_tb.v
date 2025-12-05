module module_name_tb;
reg a,b;
wire y;
module_name a(a,b,y);
initial begin
	a=0; b=1;
	#5 ......
	#5 $finish;
end

initial begin
	$display("",);
	$monitor("",);
end

endmodule

/*
* OUTPUT
*
*/
