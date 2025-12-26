module led_blink(
    input clk,rst,
    output reg led
);
integer count = 0;
always @(posedge clk) begin
    if(rst || count == 50000000) begin
        count = 0;
        led = 0;
    end
    else begin
        count = count + 1'b1;
        led = (count <= 25000000) ? 1'b0 : 1'b1;
    end
end
endmodule
