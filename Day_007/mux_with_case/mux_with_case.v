module mux_with_case(
    input in0,in1,s,
    output reg out
);
always @(*) begin
    case(s)
        1'b0:out=in0;
        1'b1:out=in1;
        default:out=1'bz;
    endcase
end
endmodule
