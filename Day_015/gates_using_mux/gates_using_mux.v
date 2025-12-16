module gates_using_mux(
    input a,b,
	output [7:0]y
);
wire inv_a;
_2x1_mux not_a(.in0(1'b1),.in1(1'b0),.sel(a),.out(inv_a));

_2x1_mux and_gate(.in0(1'b0),.in1(a),.sel(b),.out(y[7]));    // AND gate
_2x1_mux or_gate(.in0(a),.in1(1'b1),.sel(b),.out(y[6]));    // OR gate
_2x1_mux nand_gate(.in0(1'b1),.in1(inv_a),.sel(b),.out(y[5]));    // NAND gate
_2x1_mux nor_gate(.in0(inv_a),.in1(1'b0),.sel(b),.out(y[4]));    // NOR gate
_2x1_mux xor_gate(.in0(a),.in1(inv_a),.sel(b),.out(y[3]));    // XOR gate
_2x1_mux xnor_gate(.in0(inv_a),.in1(a),.sel(b),.out(y[2]));    // XNOR gate

_2x1_mux not_gate(.in0(1'b1),.in1(1'b0),.sel(b),.out(y[1]));    // NOT gate
_2x1_mux buffer(.in0(1'b0),.in1(1'b1),.sel(b),.out(y[0]));    // Buffer

endmodule

module _2x1_mux(
    input in0,in1,
    input sel,
    output out
);
assign out = sel ? in1 : in0;
endmodule
