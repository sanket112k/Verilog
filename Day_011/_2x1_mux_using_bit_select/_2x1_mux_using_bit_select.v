module _2x1_mux_using_bit_select(
    input [1:0]in,
    input s,
    output out
);
assign out=in[s];
endmodule
