module _8x1_mux_tb;
reg [7:0]in;
reg [2:0]s;
wire out;
_8x1_mux dut(in,s,out);
initial begin
    s=3'b000;in[0]=1'b0;#5
    s=3'b000;in[0]=1'b1;#5
    s=3'b001;in[1]=1'b0;in[0]=1'bx;#5
    s=3'b001;in[1]=1'b1;in[0]=1'bx;#5
    s=3'b010;in[2]=1'b0;in[1]=1'bx;#5
    s=3'b010;in[2]=1'b1;in[1]=1'bx;#5
    s=3'b011;in[3]=1'b0;in[2]=1'bx;#5
    s=3'b011;in[3]=1'b1;in[2]=1'bx;#5
    s=3'b100;in[3]=1'bx;in[4]=1'b0;#5
    s=3'b100;in[3]=1'bx;in[4]=1'b1;#5
    s=3'b101;in[4]=1'bx;in[5]=1'b0;#5 
    s=3'b101;in[4]=1'bx;in[5]=1'b1;#5
    s=3'b110;in[5]=1'bx;in[6]=1'b0;#5
    s=3'b110;in[5]=1'bx;in[6]=1'b1;#5
    s=3'b111;in[6]=1'bx;in[7]=1'b0;#5
    s=3'b111;in[6]=1'bx;in[7]=1'b1;#5
    $finish;
end
initial begin
    $monitor("select=%b input0=%b input1=%b input2=%b input3=%b input4=%b input5=%b input6=%b input7=%b output=%b",s,in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7],out);
end
endmodule

/*
* OUTPUT
select=000 input0=0 input1=x input2=x input3=x input4=x input5=x input6=x input7=x output=0
select=000 input0=1 input1=x input2=x input3=x input4=x input5=x input6=x input7=x output=1
select=001 input0=x input1=0 input2=x input3=x input4=x input5=x input6=x input7=x output=0
select=001 input0=x input1=1 input2=x input3=x input4=x input5=x input6=x input7=x output=1
select=010 input0=x input1=x input2=0 input3=x input4=x input5=x input6=x input7=x output=0
select=010 input0=x input1=x input2=1 input3=x input4=x input5=x input6=x input7=x output=1
select=011 input0=x input1=x input2=x input3=0 input4=x input5=x input6=x input7=x output=0
select=011 input0=x input1=x input2=x input3=1 input4=x input5=x input6=x input7=x output=1
select=100 input0=x input1=x input2=x input3=x input4=0 input5=x input6=x input7=x output=0
select=100 input0=x input1=x input2=x input3=x input4=1 input5=x input6=x input7=x output=1
select=101 input0=x input1=x input2=x input3=x input4=x input5=0 input6=x input7=x output=0
select=101 input0=x input1=x input2=x input3=x input4=x input5=1 input6=x input7=x output=1
select=110 input0=x input1=x input2=x input3=x input4=x input5=x input6=0 input7=x output=0
select=110 input0=x input1=x input2=x input3=x input4=x input5=x input6=1 input7=x output=1
select=111 input0=x input1=x input2=x input3=x input4=x input5=x input6=x input7=0 output=0
select=111 input0=x input1=x input2=x input3=x input4=x input5=x input6=x input7=1 output=1
_8x1_mux_tb.v:23: $finish called at 80 (1s)
* 
*/
