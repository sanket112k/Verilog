module adder_sutractor_with_overflow_tb;
parameter N=3;
reg [N-1:0]a,b;
reg cin;
wire cout;
wire [N-1:0]sum;
integer i,j;
adder_sutractor_with_overflow #(.N(N)) dut(a,b,cin,cout,overflow,sum);
initial begin
    cin=0;
    for(i=0;i<2**N;i=i+1)begin
        a=i;
        for(j=0;j<2**N;j=j+1) begin
            b=j;#10;
        end
        #10;
    end
    cin=1;
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
    $monitor("a=%b b=%b m=%b sum=%b cout=%b overflow=%b",a,b,cin,sum,cout,overflow);
end
endmodule

/*
* OUTPUT
a=000 b=000 m=0 sum=000 cout=0 overflow=0
a=000 b=001 m=0 sum=001 cout=0 overflow=0
a=000 b=010 m=0 sum=010 cout=0 overflow=0
a=000 b=011 m=0 sum=011 cout=0 overflow=0
a=000 b=100 m=0 sum=100 cout=0 overflow=0
a=000 b=101 m=0 sum=101 cout=0 overflow=0
a=000 b=110 m=0 sum=110 cout=0 overflow=0
a=000 b=111 m=0 sum=111 cout=0 overflow=0
a=001 b=000 m=0 sum=001 cout=0 overflow=0
a=001 b=001 m=0 sum=010 cout=0 overflow=0
a=001 b=010 m=0 sum=011 cout=0 overflow=0
a=001 b=011 m=0 sum=100 cout=0 overflow=1
a=001 b=100 m=0 sum=101 cout=0 overflow=0
a=001 b=101 m=0 sum=110 cout=0 overflow=0
a=001 b=110 m=0 sum=111 cout=0 overflow=0
a=001 b=111 m=0 sum=000 cout=1 overflow=0
a=010 b=000 m=0 sum=010 cout=0 overflow=0
a=010 b=001 m=0 sum=011 cout=0 overflow=0
a=010 b=010 m=0 sum=100 cout=0 overflow=1
a=010 b=011 m=0 sum=101 cout=0 overflow=1
a=010 b=100 m=0 sum=110 cout=0 overflow=0
a=010 b=101 m=0 sum=111 cout=0 overflow=0
a=010 b=110 m=0 sum=000 cout=1 overflow=0
a=010 b=111 m=0 sum=001 cout=1 overflow=0
a=011 b=000 m=0 sum=011 cout=0 overflow=0
a=011 b=001 m=0 sum=100 cout=0 overflow=1
a=011 b=010 m=0 sum=101 cout=0 overflow=1
a=011 b=011 m=0 sum=110 cout=0 overflow=1
a=011 b=100 m=0 sum=111 cout=0 overflow=0
a=011 b=101 m=0 sum=000 cout=1 overflow=0
a=011 b=110 m=0 sum=001 cout=1 overflow=0
a=011 b=111 m=0 sum=010 cout=1 overflow=0
a=100 b=000 m=0 sum=100 cout=0 overflow=0
a=100 b=001 m=0 sum=101 cout=0 overflow=0
a=100 b=010 m=0 sum=110 cout=0 overflow=0
a=100 b=011 m=0 sum=111 cout=0 overflow=0
a=100 b=100 m=0 sum=000 cout=1 overflow=1
a=100 b=101 m=0 sum=001 cout=1 overflow=1
a=100 b=110 m=0 sum=010 cout=1 overflow=1
a=100 b=111 m=0 sum=011 cout=1 overflow=1
a=101 b=000 m=0 sum=101 cout=0 overflow=0
a=101 b=001 m=0 sum=110 cout=0 overflow=0
a=101 b=010 m=0 sum=111 cout=0 overflow=0
a=101 b=011 m=0 sum=000 cout=1 overflow=0
a=101 b=100 m=0 sum=001 cout=1 overflow=1
a=101 b=101 m=0 sum=010 cout=1 overflow=1
a=101 b=110 m=0 sum=011 cout=1 overflow=1
a=101 b=111 m=0 sum=100 cout=1 overflow=0
a=110 b=000 m=0 sum=110 cout=0 overflow=0
a=110 b=001 m=0 sum=111 cout=0 overflow=0
a=110 b=010 m=0 sum=000 cout=1 overflow=0
a=110 b=011 m=0 sum=001 cout=1 overflow=0
a=110 b=100 m=0 sum=010 cout=1 overflow=1
a=110 b=101 m=0 sum=011 cout=1 overflow=1
a=110 b=110 m=0 sum=100 cout=1 overflow=0
a=110 b=111 m=0 sum=101 cout=1 overflow=0
a=111 b=000 m=0 sum=111 cout=0 overflow=0
a=111 b=001 m=0 sum=000 cout=1 overflow=0
a=111 b=010 m=0 sum=001 cout=1 overflow=0
a=111 b=011 m=0 sum=010 cout=1 overflow=0
a=111 b=100 m=0 sum=011 cout=1 overflow=1
a=111 b=101 m=0 sum=100 cout=1 overflow=0
a=111 b=110 m=0 sum=101 cout=1 overflow=0
a=111 b=111 m=0 sum=110 cout=1 overflow=0
a=000 b=000 m=1 sum=000 cout=1 overflow=0
a=000 b=001 m=1 sum=111 cout=0 overflow=0
a=000 b=010 m=1 sum=110 cout=0 overflow=0
a=000 b=011 m=1 sum=101 cout=0 overflow=0
a=000 b=100 m=1 sum=100 cout=0 overflow=1
a=000 b=101 m=1 sum=011 cout=0 overflow=0
a=000 b=110 m=1 sum=010 cout=0 overflow=0
a=000 b=111 m=1 sum=001 cout=0 overflow=0
a=001 b=000 m=1 sum=001 cout=1 overflow=0
a=001 b=001 m=1 sum=000 cout=1 overflow=0
a=001 b=010 m=1 sum=111 cout=0 overflow=0
a=001 b=011 m=1 sum=110 cout=0 overflow=0
a=001 b=100 m=1 sum=101 cout=0 overflow=1
a=001 b=101 m=1 sum=100 cout=0 overflow=1
a=001 b=110 m=1 sum=011 cout=0 overflow=0
a=001 b=111 m=1 sum=010 cout=0 overflow=0
a=010 b=000 m=1 sum=010 cout=1 overflow=0
a=010 b=001 m=1 sum=001 cout=1 overflow=0
a=010 b=010 m=1 sum=000 cout=1 overflow=0
a=010 b=011 m=1 sum=111 cout=0 overflow=0
a=010 b=100 m=1 sum=110 cout=0 overflow=1
a=010 b=101 m=1 sum=101 cout=0 overflow=1
a=010 b=110 m=1 sum=100 cout=0 overflow=1
a=010 b=111 m=1 sum=011 cout=0 overflow=0
a=011 b=000 m=1 sum=011 cout=1 overflow=0
a=011 b=001 m=1 sum=010 cout=1 overflow=0
a=011 b=010 m=1 sum=001 cout=1 overflow=0
a=011 b=011 m=1 sum=000 cout=1 overflow=0
a=011 b=100 m=1 sum=111 cout=0 overflow=1
a=011 b=101 m=1 sum=110 cout=0 overflow=1
a=011 b=110 m=1 sum=101 cout=0 overflow=1
a=011 b=111 m=1 sum=100 cout=0 overflow=1
a=100 b=000 m=1 sum=100 cout=1 overflow=0
a=100 b=001 m=1 sum=011 cout=1 overflow=1
a=100 b=010 m=1 sum=010 cout=1 overflow=1
a=100 b=011 m=1 sum=001 cout=1 overflow=1
a=100 b=100 m=1 sum=000 cout=1 overflow=0
a=100 b=101 m=1 sum=111 cout=0 overflow=0
a=100 b=110 m=1 sum=110 cout=0 overflow=0
a=100 b=111 m=1 sum=101 cout=0 overflow=0
a=101 b=000 m=1 sum=101 cout=1 overflow=0
a=101 b=001 m=1 sum=100 cout=1 overflow=0
a=101 b=010 m=1 sum=011 cout=1 overflow=1
a=101 b=011 m=1 sum=010 cout=1 overflow=1
a=101 b=100 m=1 sum=001 cout=1 overflow=0
a=101 b=101 m=1 sum=000 cout=1 overflow=0
a=101 b=110 m=1 sum=111 cout=0 overflow=0
a=101 b=111 m=1 sum=110 cout=0 overflow=0
a=110 b=000 m=1 sum=110 cout=1 overflow=0
a=110 b=001 m=1 sum=101 cout=1 overflow=0
a=110 b=010 m=1 sum=100 cout=1 overflow=0
a=110 b=011 m=1 sum=011 cout=1 overflow=1
a=110 b=100 m=1 sum=010 cout=1 overflow=0
a=110 b=101 m=1 sum=001 cout=1 overflow=0
a=110 b=110 m=1 sum=000 cout=1 overflow=0
a=110 b=111 m=1 sum=111 cout=0 overflow=0
a=111 b=000 m=1 sum=111 cout=1 overflow=0
a=111 b=001 m=1 sum=110 cout=1 overflow=0
a=111 b=010 m=1 sum=101 cout=1 overflow=0
a=111 b=011 m=1 sum=100 cout=1 overflow=0
a=111 b=100 m=1 sum=011 cout=1 overflow=0
a=111 b=101 m=1 sum=010 cout=1 overflow=0
a=111 b=110 m=1 sum=001 cout=1 overflow=0
a=111 b=111 m=1 sum=000 cout=1 overflow=0
adder_sutractor_with_overflow_tb.v:26: $finish called at 1440 (1s)
* 
*/
