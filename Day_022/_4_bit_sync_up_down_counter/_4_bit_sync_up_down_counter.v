module _4_bit_sync_up_down_counter(
    input clk,
    input reset,    //sync reset
    input mode_up,
    output reg [3:0]count
);
initial begin
    count = 0;
end
always @(posedge clk) begin
    if(reset) count = 0;
    else count = mode_up ? count + 1'b1 : count - 1'b1;
end
endmodule
