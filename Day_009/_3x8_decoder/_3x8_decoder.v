module _3x8_decoder (
    input [2:0]in,
    output reg [7:0]out
);
always @(*) begin
    out={8{1'b0}};
    out[in]=1'b1;
end
endmodule
