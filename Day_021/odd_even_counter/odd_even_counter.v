module odd_even_counter #(parameter N=4)(
    input clk,
    input reset,    //sync reset
    input e_mode,
    output reg [N-1:0]count
);
initial begin
    if (e_mode) count = 0;
    else count = 1;
end
always @(posedge clk) begin
    if(reset || count==2**N-2 || count==2**N-1) begin
        if (e_mode) count = 0;
        else count = 1;
    end
    else count = count + 2'h2;
end
endmodule
