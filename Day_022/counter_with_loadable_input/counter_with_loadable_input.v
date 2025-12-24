module counter_with_loadable_input(
    input clk,
    input reset,    //sync reset
    input load_en,
    input [3:0]cstart,
    output reg [3:0]count
);
always @(posedge clk) begin
    if(reset) count <= 4'b0;
    else if(load_en) count <= cstart;
    else count <= count + 1'b1;
end
endmodule
