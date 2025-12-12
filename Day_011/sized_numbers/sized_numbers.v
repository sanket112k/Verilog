module sized_numbers(
    input [5:0] bi_input,
    input [15:0] hex_input,
    output [5:0] bi_output,
    output [15:0] hex_output
);
assign bi_output=bi_input;
assign hex_output=hex_input;
endmodule
