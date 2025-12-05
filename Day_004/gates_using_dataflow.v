module gates_using_dataflow(
	input a,b,
	output [6:0]y
);
assign y[6]=a&b;
assign y[5]=a|b;
assign y[4]=~b;
assign y[3]=~(a&b);
assign y[2]=~(a|b);
assign y[1]=a^b;
assign y[0]=a~^b;
endmodule
