module siso(
    input clk,
    input sin,
    input reset,
    output reg sout
);
reg [2:0]w;
always @(posedge clk) begin
    if(reset) begin
        sout <= 1'b0;
        w <= 3'b0;
    end
    else begin
        w[2] <= sin;
        w[1] <= w[2];
        w[0] <= w[1];
        sout <= w[0];
    end
end
endmodule
