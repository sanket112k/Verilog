/*
States	North	East	South	West
S0  	Y	    R	    R	    Y 
S1  	G   	R   	R   	R 
S2  	Y   	Y   	R   	R
S3  	R   	G   	R   	R
S4  	R	    Y	    Y	    R
S5  	R	    R	    G	    R
S6  	R	    R	    Y	    Y
S7  	R	    R	    R	    G
*/      


//`define G2Y_DELAY 60
//`define Y2R_DELAY 3

module traffic_signal_controller(
    input clk, reset,
    input N_in, E_in, S_in, W_in,       //we'll get input when a vehicle arrives at that road
    output reg [1:0]N_out, E_out, S_out, W_out
);

parameter [1:0] R = 2'd0, Y = 2'd1, G = 2'd2;
parameter [2:0] S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3, S4 = 3'd4, S5 = 3'd5, S6 = 3'd6, S7 = 3'd7;
reg [2:0] state, next_state;
parameter G2Y_DELAY = 60, Y2R_DELAY = 3;

always @(posedge clk) begin
    if(reset) state <= S0;
    else state <= next_state;
end

always @(state) begin
    case (state)
        S0: begin N_out = Y; E_out = R; S_out = R; W_out = Y; end
        S1: begin N_out = G; E_out = R; S_out = R; W_out = R; end
        S2: begin N_out = Y; E_out = Y; S_out = R; W_out = R; end
        S3: begin N_out = R; E_out = G; S_out = R; W_out = R; end
        S4: begin N_out = R; E_out = Y; S_out = Y; W_out = R; end
        S5: begin N_out = R; E_out = R; S_out = G; W_out = R; end
        S6: begin N_out = R; E_out = R; S_out = Y; W_out = Y; end
        S7: begin N_out = R; E_out = R; S_out = R; W_out = G; end
    endcase
end

always @(state or N_in or E_in or S_in or W_in) begin
    case (state)
        S0: begin
            repeat(Y2R_DELAY) @(posedge clk);
            next_state = (N_in) ? S1 : S2;
        end
        S1: begin
            repeat(G2Y_DELAY) @(posedge clk);
            next_state = S2;
        end
        S2: begin
            repeat(Y2R_DELAY) @(posedge clk);
            next_state = (E_in) ? S3 : S4;
        end
        S3: begin
            repeat(G2Y_DELAY) @(posedge clk);
            next_state = S4;
        end
        S4: begin
            repeat(Y2R_DELAY) @(posedge clk);
            next_state = (S_in) ? S5 : S6;
        end
        S5: begin
            repeat(G2Y_DELAY) @(posedge clk);
            next_state = S6;
        end
        S6: begin
            repeat(Y2R_DELAY) @(posedge clk);
            next_state = (W_in) ? S7 : S0;
        end
        S7: begin
            repeat(G2Y_DELAY) @(posedge clk);
            next_state = S0;
        end
        default: next_state = S0;
    endcase
end

endmodule
