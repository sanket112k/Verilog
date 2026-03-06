module clock_divide_by_3(
    input clk_in,
    output reg clk_out
);
reg [1:0]count = 2'd0;
always @(posedge clk_in) begin
    if(count == 2'd2)
        count <= 2'd0;
    clk_out <= count[1];
    count   <= count + 2'd1;
end
endmodule
