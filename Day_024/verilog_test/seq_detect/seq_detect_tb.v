module seq_detect_tb;
reg clk,in,reset;
wire out;

seq_detect dut(clk,in,reset,out);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 0;
    repeat(5) @(negedge clk) begin
        reset =0;
        in = $urandom_range(1'b0,1'b1);
    end
    repeat(2) @(negedge clk) begin
        reset =1;
        in = $urandom_range(1'b0,1'b1);
    end
    
    repeat(50) @(negedge clk) begin
        reset =0;
        in = $urandom_range(1'b0,1'b1);
    end
    $finish;
end
initial begin
    $monitor("clk=%b reset=%b in=%b, out=%b",clk,reset,in,out);
    $dumpfile("seq_detect.vcd");
    $dumpvars(0,seq_detect_tb);
end
endmodule
