module piso(
    input clk,
    input reset,
    input load,
    input [3:0]pin,
    output reg sout
);
reg [3:0]data_reg;
always @(posedge clk) begin
    if(reset) begin
        sout <= 1'b0;
        data_reg <= 4'b0;
    end
    else begin
        if (load) begin
            data_reg <= pin;
            sout <= pin[0];
        end
        else begin
            sout <= data_reg[0];
            data_reg <= {1'b0, data_reg[3:1]};
        end
    end
end
endmodule
