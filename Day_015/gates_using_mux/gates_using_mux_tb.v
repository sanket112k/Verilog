module gates_using_mux_tb;
reg a,b;
wire [7:0]y;
gates_using_mux dut(a,b,y);
initial begin
	a=0; b=0;
	#5 a=0; b=1;
    #5 a=1; b=0;
    #5 a=1; b=1;
	#5 $finish;
end

initial begin
	$monitor("a=%b b=%b    and_ab=%b or_ab=%b nand_ab=%b nor_ab=%b xor_ab=%b xnor_ab=%b not_b=%b buff_b=%b",a,b,y[7],y[6],y[5],y[4],y[3],y[2],y[1],y[0]);
end

endmodule

/*
* OUTPUT
a=0 b=0    and_ab=0 or_ab=0 nand_ab=1 nor_ab=1 xor_ab=0 xnor_ab=1 not_b=1 buff_b=0
a=0 b=1    and_ab=0 or_ab=1 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0 not_b=0 buff_b=1
a=1 b=0    and_ab=0 or_ab=1 nand_ab=1 nor_ab=0 xor_ab=1 xnor_ab=0 not_b=1 buff_b=0
a=1 b=1    and_ab=1 or_ab=1 nand_ab=0 nor_ab=0 xor_ab=0 xnor_ab=1 not_b=0 buff_b=1
gates_using_mux_tb.v:10: $finish called at 20 (1s)
* 
*/
