module n_bit_bcd_to_2421 #(parameter N=2)(
    input [N*4-1:0]bcd_in,
    output [N*4-1:0]_2421_out
);
genvar i;
generate
    for(i=0;i<N;i=i+1) begin
        _4bit_bcd_to_2421 dut(.in(bcd_in[i*4 +: 4]),.out(_2421_out[i*4 +: 4]));
    end
endgenerate
endmodule

module _4bit_bcd_to_2421(
    input [3:0]in,
    output reg [3:0]out
);
always @(*) begin
    case(in)
        4'b0: out=in;
        4'd1: out=in;
        4'd2: out=in;
        4'd3: out=in;
        4'd4: out=in;
        4'd5: out=4'b1011;
        4'd6: out=4'b1100;
        4'd7: out=4'b1101;
        4'd8: out=4'b1110;
        4'd9: out=4'b1111;
        default: out=4'dz;
    endcase
end
endmodule
