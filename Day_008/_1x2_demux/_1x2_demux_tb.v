module _1x2_demux_tb;
reg in,s;
wire [1:0]out;
_1x2_demux dut(in,s,out);
initial begin
    s=0;in=1'b0;#5
    s=1;in=1'b1;#5
    s=0;in=1'b1;#5
    $finish;
end
initial begin
    $monitor("select=%b input=%b output0=%b output1=%b",s,in,out[0],out[1]);
end
endmodule

/*
* OUTPUT
select=0 input=0 output0=0 output1=0
select=1 input=1 output0=0 output1=1
select=0 input=1 output0=1 output1=0
_1x2_demux_tb.v:9: $finish called at 15 (1s)
*/
