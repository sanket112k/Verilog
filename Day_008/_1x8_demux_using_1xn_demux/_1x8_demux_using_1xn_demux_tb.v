module _1x8_demux_using_1xn_demux_tb;
parameter N=8;
reg in;
reg [$clog2(N)-1:0]s;
wire [N-1:0]out;
integer i;
_1x8_demux_using_1xn_demux #(.N(N)) dut(in,s,out);
initial begin
    s=0;in=1'b0;#5
    for(i=0;i<N;i=i+1) begin
        s=i;in=1'b1;#5;
    end
    $finish;
end
initial begin
    $monitor("select=%b input=%b output%0d=%b",s,in,s,out);
end
endmodule

/*
* OUTPUT
select=000 input=0 output0=00000000
select=000 input=1 output0=00000001
select=001 input=1 output1=00000010
select=010 input=1 output2=00000100
select=011 input=1 output3=00001000
select=100 input=1 output4=00010000
select=101 input=1 output5=00100000
select=110 input=1 output6=01000000
select=111 input=1 output7=10000000
_1x8_demux_using_1xn_demux_tb.v:13: $finish called at 45 (1s)
*/
