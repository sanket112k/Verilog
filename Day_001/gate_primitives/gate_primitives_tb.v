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

/*
* Output
* @time=0 a=0 b=0 and_ab=0 or_ab=0 not_b=1 nand_ab=1 nor_ab=1 xor_ab=0 xnor_ab=1 buf_b=0
* @time=5 a=0 b=1 and_ab=0 or_ab=1 not_b=0 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0 buf_b=1
* @time=10 a=1 b=0 and_ab=0 or_ab=1 not_b=1 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0 buf_b=0
* @time=15 a=1 b=1 and_ab=1 or_ab=1 not_b=0 nand_ab=0 nor_ab=0 xor_ab=0 xnor_ab=1 buf_b=1
* gate_primitives_tb.v:21: $finish called at 20 (1s)
*/
