module _1x4_demux_tb;
reg in;
reg [1:0]s;
wire [3:0]out;
_1x4_demux dut(in,s,out);
initial begin
    s=0;in=1'b0;#5
    s=0;in=1'b1;#5
    s=1;in=1'b1;#5
    s=2;in=1'b1;#5
    s=3;in=1'b1;#5
    $finish;
end
initial begin
    $monitor("select=%b input=%b output0=%b output1=%b output2=%b output3=%b",s,in,out[0],out[1],out[2],out[3]);
end
endmodule

/*
* OUTPUT
select=00 input=0 output0=0 output1=0 output2=0 output3=0
select=00 input=1 output0=1 output1=0 output2=0 output3=0
select=01 input=1 output0=0 output1=1 output2=0 output3=0
select=10 input=1 output0=0 output1=0 output2=1 output3=0
select=11 input=1 output0=0 output1=0 output2=0 output3=1
_1x4_demux_tb.v:12: $finish called at 25 (1s)
*/
