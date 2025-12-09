module _2x4_decoder (
    input [1:0]in,
    output reg [3:0]out
);
always @(*) begin
    out={4{1'b0}};
    out[in]=1'b1;
end
endmodule
