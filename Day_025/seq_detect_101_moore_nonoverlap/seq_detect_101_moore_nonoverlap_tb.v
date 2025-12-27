module seq_detect_101_moore_nonoverlap_tb;
reg clk, reset, in;
wire out;

seq_detect_101_moore_nonoverlap dut(clk, reset, in, out);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    repeat (5) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end

    repeat (2) @(negedge clk) reset = 1;

    repeat (50) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b in=%b out=%b", $time, clk, reset, in, out);
    $dumpfile("seq_detect_101_moore_nonoverlap.vcd");
    $dumpvars(0,seq_detect_101_moore_nonoverlap_tb);
end
endmodule
