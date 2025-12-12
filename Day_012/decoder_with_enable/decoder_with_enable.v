module decoder_with_enable #(parameter N=4)(
    input [$clog2(N)-1:0]in,
    input enable,
    output reg [N-1:0]out
);
always @(*) begin
    if(enable==1'b0) out={N{1'b0}};
    else begin
        out={N{1'b0}};
        out[in]=1'b1;
    end
end
endmodule
