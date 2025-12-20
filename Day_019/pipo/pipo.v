module pipo(
    input clk,
    input reset,
    input load,
    input [3:0]pin,
    output reg [3:0]pout
);
always @(posedge clk) begin
    if(reset) begin
        pout <= 1'b0;
    end
    else if (load) pout <= pin;
end
endmodule
