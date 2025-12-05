module concatenation_operator_tb;
reg a,b,c,d;
wire [3:0]y;
concatenation_operator dut(a,b,c,d,y);
initial begin
	a=0; b=1; c=0; d=1;
    $display("input a=%b b=%b c=%b d=%b output nib=%b",a,b,c,d,y);
end
endmodule

/*
* OUTPUT
* input a=0 b=1 c=0 d=1 output nib=0101
* 
*/
