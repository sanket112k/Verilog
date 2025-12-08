module _4x1_mux(
    input [3:0]in,
    input [1:0]s,
    output out
);
assign out=s[1]?(s[0]?in[3]:in[2]):(s[0]?in[1]:in[0]);
endmodule
