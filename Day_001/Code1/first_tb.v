module first_tb;
wire a,b;
first dut(.a(a), .b(b));
initial begin
	$display("a=%b, b=%b",a,b);
end
endmodule

/*
* OUTPUT:
* a=0, b=1
*/
