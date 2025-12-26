module encoder(
    input [7:0]in,
    output reg [2:0]out
);
always @(*) begin
    casez(in)
        8'b0000_0001: out = 3'd0;
        8'b0000_001?: out = 3'd1;
        8'b0000_01??: out = 3'd2;
        8'b0000_1???: out = 3'd3;

        8'b0001_????: out = 3'd4;
        8'b001?_????: out = 3'd5;
        8'b01??_????: out = 3'd6;
        8'b1???_????: out = 3'd7;
        default: out = 3'dx;
    endcase
end
endmodule
