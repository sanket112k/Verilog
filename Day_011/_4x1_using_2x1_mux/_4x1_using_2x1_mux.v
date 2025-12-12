module _4x1_using_2x1_mux(
    input [3:0]in,
    input [1:0]s,
    output out
);
assign out=in[s];
endmodule

module _2x1_mux(
    input [1:0]in,
    input s,
    output out
);
assign out=in[s];
endmodule
