module mux_with_if_else(
    input in0,in1,s,
    output reg out
);
always @(*) begin
    if(s)
        out=in1;
    else
        out=in0;
end
endmodule
