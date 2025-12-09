module _8x1_mux(
    input [7:0]in,
    input [2:0]s,
    output out
);
assign out=in[s];
endmodule
