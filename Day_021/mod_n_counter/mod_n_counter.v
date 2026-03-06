module mod_n_counter #(parameter N = 4)(
    input clk,
    input reset,    //sync reset
);
integer count = 0;
always @(posedge clk) begin
    if (reset || count == N-1) count <= 0;
    else count <= count + 1;
end
endmodule
