module clock_divide_by_n #(parameter N=3)(
    input clk_in, reset,
    output clk_out
);
integer count = 0;
always @(posedge clk_in) begin
  if (reset || count == N-1) count <= 0;
  else count <= count + 1;
  clk_out <= (count<N/2) ? 1 : 0;
end
endmodule
