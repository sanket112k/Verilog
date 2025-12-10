module _4bit_bcd_adder(
    input [3:0]a,b,
    input cin,
    output reg cout,
    output reg [3:0]sum_bcd
);
wire [4:0]sum_binary;
assign sum_binary=a+b+cin;

always @(*) begin
    if(sum_binary>9) begin
        sum_bcd=sum_binary[3:0]+4'b0110;
        cout=1'b1;
    end
    else begin
        sum_bcd=sum_binary[3:0];
        cout=1'b0;
    end
end
endmodule
