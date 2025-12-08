module ripple_carry_adder_4bit_tb;
reg [3:0]a,b;
reg cin;
wire cout;
wire [3:0]sum;
ripple_carry_adder_4bit dut(a,b,cin,cout,sum);
initial begin
    cin=1'b0;a=4'd0;b=4'd0;#5
    cin=1'b0;a=4'd1;b=4'd1;#5
    cin=1'b0;a=4'd2;b=4'd2;#5
    cin=1'b0;a=4'd3;b=4'd3;#5
    cin=1'b0;a=4'd4;b=4'd4;#5
    cin=1'b0;a=4'd5;b=4'd5;#5
    cin=1'b0;a=4'd6;b=4'd6;#5
    cin=1'b0;a=4'd7;b=4'd7;#5
    cin=1'b0;a=4'd8;b=4'd8;#5
    cin=1'b0;a=4'd9;b=4'd9;#5
    cin=1'b0;a=4'd10;b=4'd10;#5
    cin=1'b0;a=4'd11;b=4'd11;#5
    cin=1'b0;a=4'd12;b=4'd12;#5
    cin=1'b0;a=4'd13;b=4'd13;#5
    cin=1'b0;a=4'd14;b=4'd14;#5
    cin=1'b0;a=4'd15;b=4'd15;#5
    $finish;
end
initial begin
    $monitor("a=%b b=%b sum=%b cout=%b",a,b,sum,cout);
end
endmodule

/*
* OUTPUT
a=0000 b=0000 sum=0000 cout=0
a=0001 b=0001 sum=0010 cout=0
a=0010 b=0010 sum=0100 cout=0
a=0011 b=0011 sum=0110 cout=0
a=0100 b=0100 sum=1000 cout=0
a=0101 b=0101 sum=1010 cout=0
a=0110 b=0110 sum=1100 cout=0
a=0111 b=0111 sum=1110 cout=0
a=1000 b=1000 sum=0000 cout=1
a=1001 b=1001 sum=0010 cout=1
a=1010 b=1010 sum=0100 cout=1
a=1011 b=1011 sum=0110 cout=1
a=1100 b=1100 sum=1000 cout=1
a=1101 b=1101 sum=1010 cout=1
a=1110 b=1110 sum=1100 cout=1
a=1111 b=1111 sum=1110 cout=1
ripple_carry_adder_4bit_tb.v:24: $finish called at 80 (1s)
* 
*/
