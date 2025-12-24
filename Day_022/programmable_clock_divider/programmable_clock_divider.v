module programmable_clock_divider #(parameter N=4)(
    input clk_in,
    output reg clk_out
);
reg [$clog2(N)-1:0]count = 2'd0;
always @(posedge clk_in) begin
    count <= count + 2'd1;
    if(count == N-1) count <= 2'd0;
    clk_out <= count[$clog2(N)-1];
end
endmodule
