module _2x1_mux_using_boolean_equation(
    input [1:0]in,
    input s,
    output out
);
assign out=~s&in[0]|s&in[1];
endmodule
