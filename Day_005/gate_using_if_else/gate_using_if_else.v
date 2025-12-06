module gate_using_if_else(
	input a,b,
	output reg [6:0]y
);

always @(*)begin
    if(a===1'b0||b===1'b0)      //AND gate using if_else
        y[6]=1'b0;
    else if(a===1'b1&&b===1'b1)
        y[6]=1'b1;
    else
        y[6]=1'bx;

    if(a===1'b1||b===1'b1)      //OR gate using if_else
        y[5]=1'b1;
    else if(a===1'b0&&b===1'b0)
        y[5]=1'b0;
    else
        y[5]=1'bx;

    if(b===1'b1)                //NOT gate using if_else
        y[4]=1'b0;
    else if(b===1'b0)
        y[4]=1'b1;
    else
        y[4]=1'bx;

    if(a===1'b0||b===1'b0)      //NAND gate using if_else
        y[3]=1'b1;
    else if(a===1'b1&&b===1'b1)
        y[3]=1'b0;
    else
        y[3]=1'bx;

    if(a===1'b1||b===1'b1)      //NOR gate using if_else
        y[2]=1'b0;
    else if(a===1'b0&&b===1'b0)
        y[2]=1'b1;
    else
        y[2]=1'bx;

    if(a===1'bx||b===1'bx||a===1'bz||b===1'bz)      //XOR gate using if_else
        y[1]=1'bx;
    else if(a==b)
        y[1]=1'b0;
    else
        y[1]=1'b1;

    if(a===1'bx||b===1'bx||a===1'bz||b===1'bz)      //XNOR gate using if_else
        y[0]=1'bx;
    else if(a==b)
        y[0]=1'b1;
    else
        y[0]=1'b0;
end

endmodule
