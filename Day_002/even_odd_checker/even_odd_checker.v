module even_odd_checker(input [3:0]in, output reg out);
always @(*)begin
	if(in[0]==0)
		out=0;
	else
		out=1;
end
endmodule
