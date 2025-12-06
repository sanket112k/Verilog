module if_else_vs_conditional_opr(
    input a,b,
    output reg y,
    output z
);

always @(*)
begin
    if(a==1'b1&&b==1'b1)    //AND gate using if_else
        y=1'b1;
    else
        y=1'b0;
end

assign z=(a==1'b1&&b==1'b1)? 1'b1 : 1'b0;   //AND gate using conditional operator
endmodule
