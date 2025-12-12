module _4x1_using_2x1_mux(
    input [3:0]in,
    input [1:0]s,
    output out
);
wire [1:0]w;
_2x1_mux dut1(.in(in[3:2]),.s(s[0]),.out(w[1]));
_2x1_mux dut2(.in(in[1:0]),.s(s[0]),.out(w[0]));
_2x1_mux dut3(.in(w),.s(s[1]),.out(out));
endmodule

module _2x1_mux(
    input [1:0]in,
    input s,
    output out
);
assign out=in[s];
endmodule
