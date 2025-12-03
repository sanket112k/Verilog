module part_select_tb;
reg [7:0]byte;
wire [3:0]nib1;
wire [3:0]nib2;
part_select d(byte,nib1,nib2);
initial begin
	$monitor("@time=%0t | in=%b | 1st nibble=%b | 2nd nibble=%b",$time,byte, nib1, nib2);
	byte=8'b00001111;
	#10 byte=8'b01010000;
	#10 byte=8'b01110001;
	#10 $finish;
end
endmodule
