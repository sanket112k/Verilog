module gate_primitives_tb;
reg a,b;
wire y1,y2,y3,y4,y5,y6,y7,y8;
gate_primitives dut(
	.a(a), 
	.b(b),
	.y1(y1),
	.y2(y2),
	.y3(y3),
	.y4(y4),
	.y5(y5),
	.y6(y6),
	.y7(y7),
	.y8(y8)
);
initial begin
	a=1'b0;b=1'b0;#5  
	a=1'b0;b=1'b1;#5 
	a=1'b1;b=1'b0;#5 
	a=1'b1;b=1'b1;#5 
	$finish;
end
initial begin
	$monitor("@time=%0t a=%b b=%b and_ab=%b or_ab=%b not_b=%b nand_ab=%b nor_ab=%b xor_ab=%b xnor_ab=%b buf_b=%b",$time,a,b,y1,y2,y3,y4,y5,y6,y7,y8);
end
endmodule
