module reduction_operators(
	input  [3:0]x,
	output [5:0]y
);
	assign y[5]=&x;
	assign y[4]=~&x;
	assign y[3]=|x;
	assign y[2]=~|x;
	assign y[1]=^x;
	assign y[0]=~^x;
endmodule
