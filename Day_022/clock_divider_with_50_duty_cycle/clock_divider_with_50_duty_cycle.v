module clock_divider_with_50_duty_cycle #(parameter N=3)(
    input clk_in,
    output clk_out
);
reg [$clog2(N)-1:0]count = 2'd0;
reg clk1,clk2;
always @(posedge clk_in) begin
    count <= count + 2'd1;
    if(count == N-1) count <= 2'd0;
    clk1 <= (count<N/2) ? 1'b1 : 1'b0;
end
always @(negedge clk_in) clk2 <= clk1;
assign clk_out = (N%2) ? clk1|clk2 : clk1;
endmodule
