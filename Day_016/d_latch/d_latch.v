module d_latch(
    input en,
    input d,
    output reg q
);
always @(en or d) begin
    if(en) q<=d;
end
endmodule
