module mux_with_conditional_operator(
    input in0,in1,s,
    output out
);
assign out=s?in1:in0;
endmodule
