module nbit_bcd_to_xs3 #(parameter N=2)(
    input [N*4-1:0]bcd_in,
    output [N*4-1:0]xs3_out
);
genvar i;
generate
    for(i=0;i<N;i=i+1) begin
        bcd_to_xs3_digit dut(.in(bcd_in[i*4 +: 4]),.out(xs3_out[i*4 +: 4]));
    end
endgenerate
endmodule

module bcd_to_xs3_digit(
    input [3:0]in,
    output [3:0]out
);
assign out=in+4'b0011;
endmodule
