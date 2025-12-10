module n_bit_ripple_carry_adder_tb;
parameter N=3;
reg [N-1:0]a,b;
reg cin;
wire cout;
wire [N-1:0]sum;
integer i,j;
n_bit_ripple_carry_adder #(.N(N)) dut(a,b,cin,cout,sum);
initial begin
    cin=0;
    for(i=0;i<2**N;i=i+1)begin
        a=i;
        for(j=0;j<2**N;j=j+1) begin
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
a=000 b=000 sum=000 cout=0
a=000 b=001 sum=001 cout=0
a=000 b=010 sum=010 cout=0
a=000 b=011 sum=011 cout=0
a=000 b=100 sum=100 cout=0
a=000 b=101 sum=101 cout=0
a=000 b=110 sum=110 cout=0
a=000 b=111 sum=111 cout=0
a=001 b=000 sum=001 cout=0
a=001 b=001 sum=010 cout=0
a=001 b=010 sum=011 cout=0
a=001 b=011 sum=100 cout=0
a=001 b=100 sum=101 cout=0
a=001 b=101 sum=110 cout=0
a=001 b=110 sum=111 cout=0
a=001 b=111 sum=000 cout=1
a=010 b=000 sum=010 cout=0
a=010 b=001 sum=011 cout=0
a=010 b=010 sum=100 cout=0
a=010 b=011 sum=101 cout=0
a=010 b=100 sum=110 cout=0
a=010 b=101 sum=111 cout=0
a=010 b=110 sum=000 cout=1
a=010 b=111 sum=001 cout=1
a=011 b=000 sum=011 cout=0
a=011 b=001 sum=100 cout=0
a=011 b=010 sum=101 cout=0
a=011 b=011 sum=110 cout=0
a=011 b=100 sum=111 cout=0
a=011 b=101 sum=000 cout=1
a=011 b=110 sum=001 cout=1
a=011 b=111 sum=010 cout=1
a=100 b=000 sum=100 cout=0
a=100 b=001 sum=101 cout=0
a=100 b=010 sum=110 cout=0
a=100 b=011 sum=111 cout=0
a=100 b=100 sum=000 cout=1
a=100 b=101 sum=001 cout=1
a=100 b=110 sum=010 cout=1
a=100 b=111 sum=011 cout=1
a=101 b=000 sum=101 cout=0
a=101 b=001 sum=110 cout=0
a=101 b=010 sum=111 cout=0
a=101 b=011 sum=000 cout=1
a=101 b=100 sum=001 cout=1
a=101 b=101 sum=010 cout=1
a=101 b=110 sum=011 cout=1
a=101 b=111 sum=100 cout=1
a=110 b=000 sum=110 cout=0
a=110 b=001 sum=111 cout=0
a=110 b=010 sum=000 cout=1
a=110 b=011 sum=001 cout=1
a=110 b=100 sum=010 cout=1
a=110 b=101 sum=011 cout=1
a=110 b=110 sum=100 cout=1
a=110 b=111 sum=101 cout=1
a=111 b=000 sum=111 cout=0
a=111 b=001 sum=000 cout=1
a=111 b=010 sum=001 cout=1
a=111 b=011 sum=010 cout=1
a=111 b=100 sum=011 cout=1
a=111 b=101 sum=100 cout=1
a=111 b=110 sum=101 cout=1
a=111 b=111 sum=110 cout=1
n_bit_ripple_carry_adder_tb.v:18: $finish called at 720 (1s)
* 
*/
