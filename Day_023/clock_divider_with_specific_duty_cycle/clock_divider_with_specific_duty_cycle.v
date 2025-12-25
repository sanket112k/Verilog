module clock_divider_with_specific_duty_cycle #(parameter N=3, parameter DC=50)(
    input clk_in,
    output clk_out
);
reg [$clog2(N)-1:0]count = 2'd0;
reg clk1,clk2,clk3;
always @(posedge clk_in) begin
    count <= count + 2'd1;
    if(count == N-1) count <= 2'd0;
    clk1 <= (count<N*DC/100) ? 1'b1 : 1'b0;
    clk3 <= clk1;
end
always @(negedge clk_in) clk2 <= clk1;
assign clk_out = (N*DC%100) ? ((N*DC%100 <= 50) ? clk1|clk2 : clk1|clk3) : clk1;
endmodule
