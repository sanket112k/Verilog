module _0_99_counter (
input clk,
input reset,   // Synchronous active-high reset
output [7:0] q
);
wire ena;
assign ena = q[3:0]==9 ? 1'b1 : 1'b0;
decade_counter dut0(clk, reset, 1'b1, q[3:0]);
decade_counter dut1(clk, reset, ena, q[7:4]);
endmodule

module decade_counter (
input clk,
input reset,        // Synchronous active-high reset
input en,
output reg [3:0] q
);
initial q=0;
always @(posedge clk) begin
    if(reset) q<=0;
    else if (en) begin
        if (q==9) q<=0;
    	else q<=q+1;
    end
end
endmodule
