module n_bit_register #(parameter N=4)(
    input clk,
    input reset,
    input load,
    input [N-1:0]pin,
    output reg [N-1:0]pout
);
always @(posedge clk) begin
    if(reset) begin
        pout <= {N{1'b0}};
    end
    else if (load) pout <= pin;
end
endmodule
