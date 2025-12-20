// 4-BIT SERIAL IN PARALLEL OUT REGISTER

module sipo(
    input clk,
    input sin,
    input reset,
    output reg [3:0]pout
);
always @(posedge clk) begin
    if(reset) begin
        pout <= 4'b0;
    end
    else begin
        pout[3] <= sin;
        pout[2] <= pout[3];
        pout[1] <= pout[2];
        pout[0] <= pout[1];
    end
end
endmodule
