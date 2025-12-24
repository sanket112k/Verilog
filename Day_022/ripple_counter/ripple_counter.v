module ripple_counter(
    input clk,
    input reset,
    output reg [3:0]out
);
initial out = 0;

always @(negedge clk) begin
    if(reset) out = 0;
    else out[0] <= ~out[0];
end
always @(negedge out[0]) begin
    if(reset) out = 0;
    else out[1] <= ~out[1];
end
always @(negedge out[1]) begin
    if(reset) out = 0;
    else out[2] <= ~out[2];
end
always @(negedge out[2]) begin
    if(reset) out = 0;
    else out[3] <= ~out[3];
end
endmodule
