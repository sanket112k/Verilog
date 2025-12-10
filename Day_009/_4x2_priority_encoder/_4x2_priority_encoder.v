module _4x2_priority_encoder (
    input [3:0]in,
    output reg [1:0]out,
    output reg valid
);
integer i;
always @(*) begin
    for(i=0;i<4;i=i+1) begin
        if(in==0) begin 
            valid=0;
            out={2{1'bx}};
        end
        else if(in[i]===1'b1) begin
            valid=1;
            out<=i;
            i<=4;
        end
        else out=1'bz;
    end
end
endmodule
