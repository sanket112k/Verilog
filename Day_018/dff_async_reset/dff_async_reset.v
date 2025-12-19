module dff_async_reset(
    input clk,d,reset,
    output reg q
);
always @(posedge clk or posedge reset) begin
    if(reset) q<=0;
    else q<=d;
end
endmodule
