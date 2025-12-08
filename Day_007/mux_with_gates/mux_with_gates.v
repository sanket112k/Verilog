module mux_with_gates(
    input in0,in1,s,
    output out
);
wire w1,w2;
and g1(w1,in0,~s);
and g2(w2,in1,s);
or g3(out,w1,w2);
endmodule
