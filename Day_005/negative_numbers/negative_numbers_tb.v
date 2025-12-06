module negative_numbers_tb;
reg [7:0]data;
wire [7:0]out1;
wire [7:0]out2;

negative_numbers dut(data,out1,out2);
initial begin
    data=8'b00000000;
    #5 data=8'b00000001;
    #5 data=8'b00010000;
    #5 data=8'b11000000;
    #5 data=8'b11110000;
    #5 data=8'b11111111;
    #5 data=8'b00z00x01;
    #5$finish;
end
initial begin
    $monitor("data=%b 1's_comp_data=%b 2's_comp_data=%b",data,out1,out2);
end
endmodule

/*
* OUTPUT
data=00000000 1's_comp_data=11111111 2's_comp_data=00000000
data=00000001 1's_comp_data=11111110 2's_comp_data=11111111
data=00010000 1's_comp_data=11101111 2's_comp_data=11110000
data=11000000 1's_comp_data=00111111 2's_comp_data=01000000
data=11110000 1's_comp_data=00001111 2's_comp_data=00010000
data=11111111 1's_comp_data=00000000 2's_comp_data=00000001
data=00z00x01 1's_comp_data=11x11x10 2's_comp_data=xxxxxxxx
negative_numbers_tb.v:15: $finish called at 35 (1s)
* 
*/
