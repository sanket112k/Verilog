module negative_numbers(
    input [7:0]data,
    output [7:0]out1,
    output [7:0]out2
);
assign out1=~data;          //1's compliment
assign out2=~data+1'b1;     //2's compliment
endmodule
