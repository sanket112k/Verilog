module _nx1_mux_tb;
parameter N=8;
reg [N-1:0]in;
reg [$clog2(N)-1:0]s;
wire out;
integer i;
reg ins;
_nx1_mux #(.N(8)) dut(in,s,out);
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
select=000 input0=0 output=0
select=000 input0=1 output=1
select=001 input1=0 output=0
select=001 input1=1 output=1
select=010 input2=0 output=0
select=010 input2=1 output=1
select=011 input3=0 output=0
select=011 input3=1 output=1
select=100 input4=0 output=0
select=100 input4=1 output=1
select=101 input5=0 output=0
select=101 input5=1 output=1
select=110 input6=0 output=0
select=110 input6=1 output=1
select=111 input7=0 output=0
select=111 input7=1 output=1
_nx1_mux_tb.v:14: $finish called at 160 (1s)
* 
*/
