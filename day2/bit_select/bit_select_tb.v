module part_select_tb;
reg [7:0]byte;
wire msb;
bit_select d(byte, msb);
initial begin
	$monitor("@time=%0t | in=%b | sign=%b //sign is 0 for +ve numbers and 1 for -ve numbers",$time,byte, msb);
	byte=8'b00001111;
	#10 byte=8'b11010000;
	#10 byte=8'b01110001;
	#10 byte=8'b11111111;
	#10 $finish;
end
endmodule

/*
* @time=0  | in=00001111 | sign=0 //sign is 0 for +ve numbers and 1 for -ve numbers
* @time=10 | in=11010000 | sign=1 //sign is 0 for +ve numbers and 1 for -ve numbers
* @time=20 | in=01110001 | sign=0 //sign is 0 for +ve numbers and 1 for -ve numbers
* @time=30 | in=11111111 | sign=1 //sign is 0 for +ve numbers and 1 for -ve numbers
* bit_select_tb.v:11: $finish called at 40 (1s)
* /
