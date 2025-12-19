module tff(
    input clk, reset, t,
    output reg q
);
always @(posedge clk) begin
    if(reset) q<=0;
    else q <= t ? ~q : q;
end
endmodule
