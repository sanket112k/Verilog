module _nx1_mux #(parameter N=4)(
    input [N-1:0]in,
    input [$clog2(N)-1:0]s,
    output out
);
assign out=in[s];
endmodule
