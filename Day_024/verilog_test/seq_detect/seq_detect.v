module seq_detect(
input clk,in,reset,
output out);

reg [2:0]state, next_state;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100, s5=3'b101;
always @(*) begin
    case(state)		
	    s0: next_state = in ? s1 : s0;
        s1: next_state = in ? s1 : s2;
    	s2: next_state = in ? s3 : s0;
        s3: next_state = in ? s4 : s2;
	    s4: next_state = in ? s1 : s5;
	    s5: next_state = in ? s3 : s0;
	endcase
end
always @(posedge clk) begin
    if (reset) state <= s0;
    else state <= next_state;
end
assign out = (state == s5);
endmodule
