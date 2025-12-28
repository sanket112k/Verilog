module seq_detect_110110_moore_nonoverlap(
    input clk, reset, in,
    output out
);

reg [2:0] state, next_state;
parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5, G = 3'd6;

always @(*) begin
    case(state)
        A: next_state = in ? B : A;
        B: next_state = in ? C : A;
        C: next_state = in ? C : D;
        D: next_state = in ? E : A;
        E: next_state = in ? F : B;
        F: next_state = in ? C : G;
        G: next_state = in ? B : A;
        default: next_state = 3'dx;
    endcase
end

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

assign out = (state == G);
endmodule

/***********************************************************************************/

module seq_detect_110110_moore_overlap(
    input clk, reset, in,
    output out
);

reg [2:0] state, next_state;
parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5, G = 3'd6;

always @(*) begin
    case(state)
        A: next_state = in ? B : A;
        B: next_state = in ? C : A;
        C: next_state = in ? C : D;
        D: next_state = in ? E : A;
        E: next_state = in ? F : B;
        F: next_state = in ? C : G;
        G: next_state = in ? B : D;
        default: next_state = 3'dx;
    endcase
end

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

assign out = (state == G);
endmodule

/************************************************************************************/

module seq_detect_110110_mealy_nonoverlap(
    input clk, reset, in,
    output reg out
);

reg [2:0] state, next_state;
parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5;

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

always @(*) begin
    case(state)
        A: begin next_state = in ? B : A; out = 1'b0; end
        B: begin next_state = in ? C : A; out = 1'b0; end
        C: begin next_state = in ? C : D; out = 1'b0; end
        D: begin next_state = in ? E : A; out = 1'b0; end
        E: begin next_state = in ? F : B; out = 1'b0; end
        F: begin next_state = in ? C : A; out = in ? 1'b0 : 1'b1; end
        default: begin next_state = 3'dx; out = 1'b0; end
    endcase
end

endmodule

/************************************************************************************/

module seq_detect_110110_mealy_overlap(
    input clk, reset, in,
    output reg out
);

reg [2:0] state, next_state;
parameter [2:0] A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4, F = 3'd5;

always @(posedge clk) begin
    if(reset) state <= A;
    else state <= next_state;
end

always @(*) begin
    case(state)
        A: begin next_state = in ? B : A; out = 1'b0; end
        B: begin next_state = in ? C : A; out = 1'b0; end
        C: begin next_state = in ? C : D; out = 1'b0; end
        D: begin next_state = in ? E : A; out = 1'b0; end
        E: begin next_state = in ? F : B; out = 1'b0; end
        F: begin next_state = in ? C : D; out = in ? 1'b0 : 1'b1; end
        default: begin next_state = 3'dx; out = 1'b0; end
    endcase
end

endmodule
