/*
Implement a 4-bit shift register that shifts a pattern across 4 LEDs.
Requirements:
Input: clk, rst, shift_in
Output: led[3:0]
Shift every 0.5 seconds
*/



module shift_reg(
    input clk,rst, shift_in,
    output reg [3:0]led
);
always @(posedge clk) begin
    if(rst) led = 0;
    else led = {shift_in, led[3:1]};
end
endmodule
