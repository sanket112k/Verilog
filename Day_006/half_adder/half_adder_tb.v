module half_adder_tb;
reg a,b;
wire sum;
half_adder dut(a,b,sum);
initial begin
    a=1'b0;b=1'b0;#5
    a=1'b0;b=1'b1;#5
    a=1'b1;b=1'b0;#5
    a=1'b1;b=1'b1;#5
    $finish;
end
initial begin
    $monitor("a=%b b=%b sum=%b",a,b,sum);
end
endmodule

/*
* OUTPUT
a=0 b=0 sum=0
a=0 b=1 sum=1
a=1 b=0 sum=1
a=1 b=1 sum=0
half_adder_tb.v:10: $finish called at 20 (1s)
* 
*/
