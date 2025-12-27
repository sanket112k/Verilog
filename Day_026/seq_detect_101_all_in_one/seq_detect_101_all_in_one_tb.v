module seq_detect_101_all_in_one_tb;
reg clk, reset;
reg in;
wire out1, out2, out3, out4;

seq_detect_101_moore_nonoverlap dut1(clk, reset, in, out1);
seq_detect_101_moore_overlap dut2(clk, reset, in, out2);
seq_detect_101_mealy_nonoverlap dut3(clk, reset, in, out3);
seq_detect_101_mealy_overlap dut4(clk, reset, in, out4);

always #5 clk = ~clk;

initial begin
    clk = 0;
    repeat (2) @(negedge clk) begin
        reset = 1;
        in = 4'hf;
    end

    repeat (10) @(negedge clk) begin
        reset = 0;
        in = ~in;
    end

    $finish;
end
initial begin
    $dumpfile("seq_detect_101_all_in_one.vcd");
    $dumpvars(0,seq_detect_101_all_in_one_tb);
end
endmodule
