module concatenation_operator(
	input msb,bit2,bit1,lsb,
	output [3:0]nib
);
	assign nib={msb,bit2,bit1,lsb};
endmodule
