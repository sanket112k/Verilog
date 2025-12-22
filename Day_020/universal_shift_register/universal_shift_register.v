// Universal Shift Register

module universal_shift_register #(parameter N=4)(
    input clk,
    input reset,
    input [1:0]m,
    input sin_l, sin_r,
    input [N-1:0]pin,
    output reg [N-1:0]pout
);
always @(posedge clk) begin
    if(reset) begin
        pout <= 4'b0;
    end
    else begin
        case (m)
            2'h0: pout <= pout;
            2'h1: pout <= {sin_r, pout[N-1:1]};
            2'h2: pout <= {pout[N-2:0],sin_l};
            2'h3: pout <= pin;
        endcase
    end
end
endmodule
