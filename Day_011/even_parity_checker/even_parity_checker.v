module even_parity_checker(
    input [3:0]in,
    input rx_pbit,
    output error
);
assign error= ^in^rx_pbit;
endmodule
