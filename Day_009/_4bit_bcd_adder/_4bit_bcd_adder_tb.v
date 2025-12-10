module _4bit_bcd_adder_tb;
reg [3:0]a,b;
reg cin;
wire cout;
wire [3:0]sum;
integer i,j;
_4bit_bcd_adder dut(a,b,cin,cout,sum);
initial begin
    cin=0;
    for(i=0;i<10;i=i+1)begin
        a=i;
        for(j=0;j<10;j=j+1) begin
            b=j;#10;
        end
        #10;
    end
    $finish;
end
initial begin
    $monitor("a=%b b=%b sum=%b cout=%b",a,b,sum,cout);
end
endmodule

/*
* OUTPUT
a=0000 b=0000 sum=0000 cout=0
a=0000 b=0001 sum=0001 cout=0
a=0000 b=0010 sum=0010 cout=0
a=0000 b=0011 sum=0011 cout=0
a=0000 b=0100 sum=0100 cout=0
a=0000 b=0101 sum=0101 cout=0
a=0000 b=0110 sum=0110 cout=0
a=0000 b=0111 sum=0111 cout=0
a=0000 b=1000 sum=1000 cout=0
a=0000 b=1001 sum=1001 cout=0
a=0001 b=0000 sum=0001 cout=0
a=0001 b=0001 sum=0010 cout=0
a=0001 b=0010 sum=0011 cout=0
a=0001 b=0011 sum=0100 cout=0
a=0001 b=0100 sum=0101 cout=0
a=0001 b=0101 sum=0110 cout=0
a=0001 b=0110 sum=0111 cout=0
a=0001 b=0111 sum=1000 cout=0
a=0001 b=1000 sum=1001 cout=0
a=0001 b=1001 sum=0000 cout=1
a=0010 b=0000 sum=0010 cout=0
a=0010 b=0001 sum=0011 cout=0
a=0010 b=0010 sum=0100 cout=0
a=0010 b=0011 sum=0101 cout=0
a=0010 b=0100 sum=0110 cout=0
a=0010 b=0101 sum=0111 cout=0
a=0010 b=0110 sum=1000 cout=0
a=0010 b=0111 sum=1001 cout=0
a=0010 b=1000 sum=0000 cout=1
a=0010 b=1001 sum=0001 cout=1
a=0011 b=0000 sum=0011 cout=0
a=0011 b=0001 sum=0100 cout=0
a=0011 b=0010 sum=0101 cout=0
a=0011 b=0011 sum=0110 cout=0
a=0011 b=0100 sum=0111 cout=0
a=0011 b=0101 sum=1000 cout=0
a=0011 b=0110 sum=1001 cout=0
a=0011 b=0111 sum=0000 cout=1
a=0011 b=1000 sum=0001 cout=1
a=0011 b=1001 sum=0010 cout=1
a=0100 b=0000 sum=0100 cout=0
a=0100 b=0001 sum=0101 cout=0
a=0100 b=0010 sum=0110 cout=0
a=0100 b=0011 sum=0111 cout=0
a=0100 b=0100 sum=1000 cout=0
a=0100 b=0101 sum=1001 cout=0
a=0100 b=0110 sum=0000 cout=1
a=0100 b=0111 sum=0001 cout=1
a=0100 b=1000 sum=0010 cout=1
a=0100 b=1001 sum=0011 cout=1
a=0101 b=0000 sum=0101 cout=0
a=0101 b=0001 sum=0110 cout=0
a=0101 b=0010 sum=0111 cout=0
a=0101 b=0011 sum=1000 cout=0
a=0101 b=0100 sum=1001 cout=0
a=0101 b=0101 sum=0000 cout=1
a=0101 b=0110 sum=0001 cout=1
a=0101 b=0111 sum=0010 cout=1
a=0101 b=1000 sum=0011 cout=1
a=0101 b=1001 sum=0100 cout=1
a=0110 b=0000 sum=0110 cout=0
a=0110 b=0001 sum=0111 cout=0
a=0110 b=0010 sum=1000 cout=0
a=0110 b=0011 sum=1001 cout=0
a=0110 b=0100 sum=0000 cout=1
a=0110 b=0101 sum=0001 cout=1
a=0110 b=0110 sum=0010 cout=1
a=0110 b=0111 sum=0011 cout=1
a=0110 b=1000 sum=0100 cout=1
a=0110 b=1001 sum=0101 cout=1
a=0111 b=0000 sum=0111 cout=0
a=0111 b=0001 sum=1000 cout=0
a=0111 b=0010 sum=1001 cout=0
a=0111 b=0011 sum=0000 cout=1
a=0111 b=0100 sum=0001 cout=1
a=0111 b=0101 sum=0010 cout=1
a=0111 b=0110 sum=0011 cout=1
a=0111 b=0111 sum=0100 cout=1
a=0111 b=1000 sum=0101 cout=1
a=0111 b=1001 sum=0110 cout=1
a=1000 b=0000 sum=1000 cout=0
a=1000 b=0001 sum=1001 cout=0
a=1000 b=0010 sum=0000 cout=1
a=1000 b=0011 sum=0001 cout=1
a=1000 b=0100 sum=0010 cout=1
a=1000 b=0101 sum=0011 cout=1
a=1000 b=0110 sum=0100 cout=1
a=1000 b=0111 sum=0101 cout=1
a=1000 b=1000 sum=0110 cout=1
a=1000 b=1001 sum=0111 cout=1
a=1001 b=0000 sum=1001 cout=0
a=1001 b=0001 sum=0000 cout=1
a=1001 b=0010 sum=0001 cout=1
a=1001 b=0011 sum=0010 cout=1
a=1001 b=0100 sum=0011 cout=1
a=1001 b=0101 sum=0100 cout=1
a=1001 b=0110 sum=0101 cout=1
a=1001 b=0111 sum=0110 cout=1
a=1001 b=1000 sum=0111 cout=1
a=1001 b=1001 sum=1000 cout=1
_4bit_bcd_adder_tb.v:17: $finish called at 1100 (1s)
* 
*/
