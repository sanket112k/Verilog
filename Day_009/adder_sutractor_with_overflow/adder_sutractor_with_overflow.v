module adder_sutractor_with_overflow #(parameter N=4)(
    input [N-1:0]a,bin,
    input cin,
    output cout,overflow,
    output [N-1:0]sum
);
wire [N:0]c;
wire [N-1:0]b;
genvar i;
assign c[0]=cin;
assign cout=c[N];
assign b=cin?~bin:bin;
assign overflow=c[N]^c[N-1];
generate
    for(i=0;i<N;i=i+1) begin
        full_adder dut(a[i],b[i],c[i],c[i+1],sum[i]);
        end
endgenerate
endmodule

module full_adder(
    input a,b,cin,
    output cout,sum
);
assign {cout,sum}=a+b+cin;
endmodule
