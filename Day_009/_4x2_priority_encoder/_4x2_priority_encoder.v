module _4x2_priority_encoder (
    input [3:0]in,
    output reg [1:0]out
);
integer i;
always @(*) begin
    for(i=0;i<4;i=i+1) begin
        if(in[i]===1'b1) begin
            out<=i;
            i<=4;
        end
        else out=1'bz;
    end
end
endmodule
