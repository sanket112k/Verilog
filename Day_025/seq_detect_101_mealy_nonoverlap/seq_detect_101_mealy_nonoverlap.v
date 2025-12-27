module seq_detect_101_mealy_nonoverlap(
    input clk, reset, in,
    output reg out
);

reg [1:0]state, next_state;
parameter A = 2'd0, B = 2'd1, C = 2'd2;

always @(*) begin
    case(state)
        A: begin next_state = in ? B : A; out = 1'b0; end
        B: begin next_state = in ? B : C; out = 1'b0; end
        C: begin next_state = in ? A : A; out = in ? 1'b1 : 1'b0; end
        default: begin next_state = A; out = 1'b0; end
    endcase
end

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

endmodule
