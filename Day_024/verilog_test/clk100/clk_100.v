module clk100(
    input clk,rst,
    output reg out
);
integer count = 0;
always @(posedge clk) begin
    if(rst || count == 500000) begin
        count = 0;
        out = 0;
    end
    else begin
        count = count + 1'b1;
        out = (count <= 250000) ? 1'b0 : 1'b1;
    end
end
endmodule
