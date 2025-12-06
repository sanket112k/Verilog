module gates_using_behaviour(
	input a,b,
	output [6:0]y
);
assign y[6]=a==1'b1&&b==1'b1 ? 1'b1:1'b0;        //a&b;
assign y[5]=a==1'b0&&b==1'b0 ? 1'b0:1'b1;        //a|b;
assign y[4]=b==1'b1 ? 1'b0:1'b1;                 //~b;
assign y[3]=a==1'b1&&b==1'b1 ? 1'b0:1'b1;        //~(a&b);
assign y[2]=a==1'b0&&b==1'b0 ? 1'b1:1'b0;        //~(a|b);
assign y[1]=a==b? 1'b0:1'b1;                   //a^b;
assign y[0]=a==b? 1'b1:1'b0;                   //a~^b;
endmodule
