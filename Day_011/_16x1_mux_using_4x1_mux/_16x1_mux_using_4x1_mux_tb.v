module _nx1_mux_tb;
parameter N=16;
reg [N-1:0]in;
reg [$clog2(N)-1:0]s;
wire out;
integer i;
reg ins;
_16x1_mux_using_4x1_mux dut(in,s,out);
initial begin
    for(i=0;i<N;i=i+1) begin
        s=i;ins=1'b0;in[s]=1'b0;#10;
        s=i;ins=1'b1;in[s]=1'b1;#10;
    end
    $finish;
end
initial begin
    $monitor("select=%b input%0d=%b output=%b",s,s,ins,out);
end
endmodule

/*
* OUTPUT
select=0000 input0=0 output=0
select=0000 input0=1 output=1
select=0001 input1=0 output=0
select=0001 input1=1 output=1
select=0010 input2=0 output=0
select=0010 input2=1 output=1
select=0011 input3=0 output=0
select=0011 input3=1 output=1
select=0100 input4=0 output=0
select=0100 input4=1 output=1
select=0101 input5=0 output=0
select=0101 input5=1 output=1
select=0110 input6=0 output=0
select=0110 input6=1 output=1
select=0111 input7=0 output=0
select=0111 input7=1 output=1
select=1000 input8=0 output=0
select=1000 input8=1 output=1
select=1001 input9=0 output=0
select=1001 input9=1 output=1
select=1010 input10=0 output=0
select=1010 input10=1 output=1
select=1011 input11=0 output=0
select=1011 input11=1 output=1
select=1100 input12=0 output=0
select=1100 input12=1 output=1
select=1101 input13=0 output=0
select=1101 input13=1 output=1
select=1110 input14=0 output=0
select=1110 input14=1 output=1
select=1111 input15=0 output=0
select=1111 input15=1 output=1
_16x1_mux_using_4x1_mux_tb.v:14: $finish called at 320 (1s)
* 
*/
