`timescale 1ms/1ms

module traffic_signal_controller_tb;
reg clk, reset;
reg N_in, E_in, S_in, W_in;
wire [1:0]N_out, E_out, S_out, W_out;

traffic_signal_controller dut(clk, reset, N_in, E_in, S_in, W_in, N_out, E_out, S_out, W_out);

always #500 clk = ~clk;

initial begin
    clk = 0; reset = 0;
    N_in = 1; E_in = 1; S_in = 1; W_in = 1;
    repeat (250) @(negedge clk);
    {N_in, E_in, S_in, W_in} = 4'b0111;
    repeat (65) @(negedge clk);
    {N_in, E_in, S_in, W_in} = 4'b1011;
    repeat (65) @(negedge clk);
    {N_in, E_in, S_in, W_in} = 4'b1101;
    repeat (65) @(negedge clk);
    {N_in, E_in, S_in, W_in} = 4'b1110;
    repeat (65) @(negedge clk);
    {N_in, E_in, S_in, W_in} = 4'b1111;
    repeat (65) @(negedge clk);
    $finish;
end
initial begin
    $dumpfile("traffic_signal_controller.vcd");
    $dumpvars(0,traffic_signal_controller_tb);
end
endmodule
