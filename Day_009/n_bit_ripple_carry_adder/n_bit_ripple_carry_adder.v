module full_adder(
    input a,b,cin,
    output cout,sum
);
assign {cout,sum}=a+b+cin;
endmodule

module n_bit_ripple_carry_adder #(parameter N=4)(
    input [N-1:0]a,b,
    input cin,
    output cout,
    output [N-1:0]sum
);
wire [N:0]c;
genvar i;
assign c[0]=cin;
assign cout=c[N];
generate
    for(i=0;i<N;i=i+1) begin
        full_adder dut(a[i],b[i],c[i],c[i+1],sum[i]);
        end
endgenerate
endmodule
