module _4x1_using_2x1_mux_tb;
parameter N=4;
reg [N-1:0]in;
reg [$clog2(N)-1:0]s;
wire out;
integer i;
reg ins;
_4x1_using_2x1_mux dut(in,s,out);
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
select=00 input0=0 output=0
select=00 input0=1 output=1
select=01 input1=0 output=0
select=01 input1=1 output=1
select=10 input2=0 output=0
select=10 input2=1 output=1
select=11 input3=0 output=0
select=11 input3=1 output=1
_4x1_using_2x1_mux_tb.v:14: $finish called at 80 (1s)
* 
*/
