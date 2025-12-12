module n_bit_bcd_adder #(
    parameter N=2           //N = BCD digit, N*4 = BCD bit
)(
    input [N*4-1:0]bcd_in1,bcd_in2,
    input cin,
    output cout,
    output [N*4-1:0]sum
);
genvar i;
wire [N:0]c;
assign c[0]=cin;
assign cout=c[N];
generate
    for (i=0;i<N;i=i+1) begin
        _4bit_bcd_adder dut1(.a(bcd_in1[i*4 +: 4]), .b(bcd_in2[i*4 +: 4]), .cin(c[i]), .cout(c[i+1]), .sum_bcd(sum[i*4 +: 4]));
    end
endgenerate
endmodule


module _4bit_bcd_adder(
    input [3:0]a,b,
    input cin,
    output reg cout,
    output reg [3:0]sum_bcd
);
wire [4:0]sum_binary;
assign sum_binary=a+b+cin;

always @(*) begin
    if(sum_binary>9) begin
        sum_bcd=sum_binary[3:0]+4'b0110;
        cout=1'b1;
    end
    else begin
        sum_bcd=sum_binary[3:0];
        cout=1'b0;
    end
end
endmodule
