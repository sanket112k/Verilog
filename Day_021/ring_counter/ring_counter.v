module ring_counter #(parameter N=4)(
    input clk,
    input rstn,   //asynchronous negedge reset
    output reg [N-1:0]pout
);

initial begin
    pout = 1;
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        pout <= 1;
    end
    else begin
        pout <= {pout[N-2:0], pout[N-1]};
    end
end
endmodule
