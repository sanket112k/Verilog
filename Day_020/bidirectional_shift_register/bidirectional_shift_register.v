// Bidirectional Shift Register

module bidirectional_shift_register #(parameter N=4)(
    input clk,
    input m,
    input sin_l,sin_r,
    input reset,
    output reg [N-1:0]pout
);
always @(posedge clk) begin
    if(reset) begin
        pout <= 4'b0;
    end
    else begin
        pout <= m ? {sin_r, pout[N-1:1]} : {pout[N-2:0],sin_l};
    end
end
endmodule
