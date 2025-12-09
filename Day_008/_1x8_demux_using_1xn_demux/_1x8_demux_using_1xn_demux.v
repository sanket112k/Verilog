module _1x8_demux_using_1xn_demux #(parameter N=4)(
    input in,
    input [$clog2(N)-1:0]s,
    output reg [N-1:0]out
);
always @(*) begin
    out={N{1'b0}};
    out[s]=in;
end
endmodule
