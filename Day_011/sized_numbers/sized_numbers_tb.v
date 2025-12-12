module sized_numbers_tb;
reg[5:0] bi_input;
reg[15:0] hex_input;
wire[5:0] bi_output;
wire[15:0] hex_output;

sized_numbers dut(
     .bi_input(bi_input),
     .hex_input(hex_input),
     .bi_output(bi_output),
     .hex_output(hex_output)
 );
initial begin
    bi_input=6'b101001;
    hex_input=16'hea75;#10
    bi_input=6'b011010;
    hex_input=16'hfb17;#10
    $finish;
end
initial begin
    $dumpfile("sized_numbers.vcd");
    $dumpvars(0,sized_numbers_tb);
    $monitor("bi_input=%b bi_output=%b     hex_input=%h hex_output=%h",bi_input,bi_output,hex_input,hex_output);
end
endmodule
