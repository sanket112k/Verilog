module bitwise_operators(input [3:0]a, input [3:0]b, output [19:0]y);
	assign y={~a,a&b,a|b,a^b,a~^b};
endmodule
