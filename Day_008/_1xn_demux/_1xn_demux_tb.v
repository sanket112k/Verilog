module _1xn_demux_tb;
parameter N=4;
reg in;
reg [$clog2(N)-1:0]s;
wire [N-1:0]out;
integer i;
_1xn_demux #(.N(N)) dut(in,s,out);
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
select=00 input=0 output0=0000
select=00 input=1 output0=0001
select=01 input=1 output1=0010
select=10 input=1 output2=0100
select=11 input=1 output3=1000
_1xn_demux_tb.v:13: $finish called at 25 (1s)
*/
