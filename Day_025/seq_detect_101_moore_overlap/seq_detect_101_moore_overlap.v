module seq_detect_101_moore_overlap(
    input clk, reset, in,
    output out
);

reg [1:0]state, next_state;
parameter A = 2'd0, B = 2'd1, C = 2'd2, D = 2'd3;

always @(*) begin
    case(state)
        A: next_state = in ? B : A;
        B: next_state = in ? B : C;
        C: next_state = in ? D : A;
        D: next_state = in ? B : C;
    endcase
end

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

assign out = (state == D);
endmodule
