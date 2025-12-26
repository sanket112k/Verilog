module adder #(parameter N=4) (
    input [N-1:0]a,b,
    output [N-1:0]sum,
    output carry
);
wire [N:0]c;
assign carry = c[N];
assign c[0] = 0;
genvar i;
generate
    for(i=0;i<N;i=i+1) begin
        full_adder dut(a[i],b[i],c[i],sum[i],c[i+1]);
    end
endgenerate
endmodule

module full_adder(
    input a,b,cin,
    output sum,cout
);
assign {cout,sum} = a+b+cin;
endmodule
