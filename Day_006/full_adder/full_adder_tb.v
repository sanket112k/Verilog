module full_adder_tb;
reg a,b,cin;
wire cout,sum;
full_adder dut(a,b,cin,cout,sum);
initial begin
    cin=1'b0;a=1'b0;b=1'b0;#5
    cin=1'b0;a=1'b0;b=1'b1;#5
    cin=1'b0;a=1'b1;b=1'b0;#5
    cin=1'b0;a=1'b1;b=1'b1;#5
    cin=1'b1;a=1'b0;b=1'b0;#5
    cin=1'b1;a=1'b0;b=1'b1;#5
    cin=1'b1;a=1'b1;b=1'b0;#5
    cin=1'b1;a=1'b1;b=1'b1;#5
    $finish;
end
initial begin
    $monitor("cin=%b a=%b b=%b sum=%b cout=%b",cin,a,b,sum,cout);
end
endmodule

/*
* OUTPUT
cin=0 a=0 b=0 sum=0 cout=0
cin=0 a=0 b=1 sum=1 cout=0
cin=0 a=1 b=0 sum=1 cout=0
cin=0 a=1 b=1 sum=0 cout=1
cin=1 a=0 b=0 sum=1 cout=0
cin=1 a=0 b=1 sum=0 cout=1
cin=1 a=1 b=0 sum=0 cout=1
cin=1 a=1 b=1 sum=1 cout=1
full_adder_tb.v:14: $finish called at 40 (1s)
* 
*/
