module _4bit_comparator(
    input [3:0]a,b,
    output reg greater,equal,lesser
);
always @(*) begin
    greater=0;
    equal=0;
    lesser=0;
    if(a==b) begin
        equal=1;
    end
    else begin
        if(a>b) greater=1;
        else lesser=1;
    end
end
endmodule
