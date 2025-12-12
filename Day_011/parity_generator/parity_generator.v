module parity_generator #(parameter N=7)(
    input [N-1:0]in,
    output even_pbit,odd_pbit
);
assign even_pbit= ^in;
assign odd_pbit=~even_pbit;
endmodule
