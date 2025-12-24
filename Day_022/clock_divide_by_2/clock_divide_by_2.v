module clock_divide_by_2(
    input clk_in,
    output reg clk_out
);
reg count=0;
always @(posedge clk_in) begin
    count <= ~count;
    clk_out <= count;
end
endmodule
