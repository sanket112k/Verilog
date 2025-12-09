module _1x4_demux(
    input in,
    input [1:0]s,
    output reg [3:0]out
);
always @(*) begin
    case(s)
        0:out={3'b0,in};
        1:out={2'b0,in,1'b0};
        2:out={1'b0,in,2'b0};
        3:out={in,3'b0};
    endcase
end
endmodule
