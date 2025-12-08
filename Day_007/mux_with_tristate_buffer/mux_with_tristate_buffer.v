module mux_with_tristate_buffer(
    input in0,in1,enable,
    output tri out
);
assign out=~enable?in0:1'bz;
assign out=enable?in1:1'bz;
endmodule
