module _2s_comp_to_sign_mag(
    input [3:0]data,
    output [3:0]out
);
assign out=data[3]===1'b0 ?data:{1'b1,(~data[2:0]+1'b1)};
endmodule
