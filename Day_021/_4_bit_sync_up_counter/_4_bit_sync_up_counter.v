module _4_bit_sync_up_counter(
    input clk,
    input reset,    //sync reset
    output reg [3:0]count
);
initial begin
    count = 0;
end
always @(posedge clk) begin
    if(reset) count = 0;
    else count = count + 1'b1;
end
endmodule
