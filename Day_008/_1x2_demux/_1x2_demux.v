module _1x2_demux(
    input in,s,
    output reg [1:0]out
);
always @(*) begin
    case(s)
        0:out={1'b0,in};
        1:out={in,1'b0};
    endcase
end
endmodule
