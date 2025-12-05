module gates_using_dataflow_tb;
reg a,b;
wire [6:0]y;
gates_using_dataflow dut(a,b,y);
initial begin
	a=0; b=0;
	#5 a=0; b=1;
    #5 a=1; b=0;
    #5 a=1; b=1;
	#5 $finish;
end

initial begin
	$monitor("@time=%0t a=%b b=%b and_ab=%b or_ab=%b not_b=%b nand_ab=%b nor_ab=%b xor_ab=%b xnor_ab=%b",$time,a,b,y[6],y[5],y[4],y[3],y[2],y[1],y[0]);
end

endmodule

/*
* OUTPUT
@time=0 a=0 b=0 and_ab=0 or_ab=0 not_b=1 nand_ab=1 nor_ab=1 xor_ab=0 xnor_ab=1
@time=5 a=0 b=1 and_ab=0 or_ab=1 not_b=0 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0
@time=10 a=1 b=0 and_ab=0 or_ab=1 not_b=1 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0
@time=15 a=1 b=1 and_ab=1 or_ab=1 not_b=0 nand_ab=0 nor_ab=0 xor_ab=0 xnor_ab=1
gates_using_dataflow_tb.v:10: $finish called at 20 (1s)
* 
*/
