module adder(
    input [3:0]a,b,
    output [3:0]sum,
    output carry
);
wire [4:0]c;
assign carry = c[4];
assign c[0] = 0;
genvar i;
generate
    for(i=0;i<4;i=i+1) begin
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
