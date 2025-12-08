module tristate_buffer(
    input data,
    input enable,
    output tri out
);
assign out=enable?data:1'bz; 
endmodule
