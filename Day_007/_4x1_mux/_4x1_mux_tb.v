module _4x1_mux_tb;
reg [3:0]in;
reg [1:0]s;
output out;
_4x1_mux dut(in,s,out);
initial begin
    s=2'b00;in[3]=1'bx;in[2]=1'bx;in[1]=1'bx;in[0]=1'b0;#5
    s=2'b00;in[3]=1'bx;in[2]=1'bx;in[1]=1'bx;in[0]=1'b1;#5
    s=2'b01;in[3]=1'bx;in[2]=1'bx;in[1]=1'b0;in[0]=1'bx;#5
    s=2'b01;in[3]=1'bx;in[2]=1'bx;in[1]=1'b1;in[0]=1'bx;#5
    s=2'b10;in[3]=1'bx;in[2]=1'b0;in[1]=1'bx;in[0]=1'bx;#5
    s=2'b10;in[3]=1'bx;in[2]=1'b1;in[1]=1'bx;in[0]=1'bx;#5
    s=2'b11;in[3]=1'b0;in[2]=1'bx;in[1]=1'bx;in[0]=1'bx;#5
    s=2'b11;in[3]=1'b1;in[2]=1'bx;in[1]=1'bx;in[0]=1'bx;#5
    $finish;
end
initial begin
    $monitor("select=%b input0=%b input1=%b input2=%b input3=%b output=%b",s,in[0],in[1],in[2],in[3],out);
end
endmodule

/*
* OUTPUT
select=00 input0=0 input1=x input2=x input3=x output=0
select=00 input0=1 input1=x input2=x input3=x output=1
select=01 input0=x input1=0 input2=x input3=x output=0
select=01 input0=x input1=1 input2=x input3=x output=1
select=10 input0=x input1=x input2=0 input3=x output=0
select=10 input0=x input1=x input2=1 input3=x output=1
select=11 input0=x input1=x input2=x input3=0 output=0
select=11 input0=x input1=x input2=x input3=1 output=1
_4x1_mux_tb.v:15: $finish called at 40 (1s)
* 
*/
