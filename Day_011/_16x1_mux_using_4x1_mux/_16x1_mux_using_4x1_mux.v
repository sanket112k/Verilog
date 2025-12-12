module _16x1_mux_using_4x1_mux(
    input [15:0]in,
    input [3:0]s,
    output out
);
wire [3:0]w;
_4x1_mux dut1(.in(in[15 : 12]),.s(s[1:0]),.out(w[3]));
_4x1_mux dut2(.in(in[11 : 8]),.s(s[1:0]),.out(w[2]));
_4x1_mux dut3(.in(in[7 : 4]),.s(s[1:0]),.out(w[1]));
_4x1_mux dut4(.in(in[3 : 0]),.s(s[1:0]),.out(w[0]));
_4x1_mux dut5(.in(w),.s(s[3:2]),.out(out));
endmodule

module _4x1_mux(
    input [3:0]in,
    input [1:0]s,
    output out
);
assign out=in[s];
endmodule
