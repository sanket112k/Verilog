module decade_counter (
    input clk,
    input reset,        // Synchronous active-high reset
    output reg [3:0] q
);
    initial q=0;
    always @(posedge clk) begin
        if(reset||q==9) q<=0;
        else q<=q+1;
    end
endmodule
