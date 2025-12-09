module log2nxn_decoder_tb;
parameter N=4;
reg [$clog2(N)-1:0]in;
wire [N-1:0]out;
integer i;
log2nxn_decoder #(.N(N)) dut(in,out);
initial begin
    for(i=0;i<N;i=i+1) begin
        in=i;#5;
    end
    $finish;
end
initial begin
    $monitor("input=%b output=%b",in,out);
end
endmodule

/*
* OUTPUT
input=00 output=0001
input=01 output=0010
input=10 output=0100
input=11 output=1000
log2nxn_decoder_tb.v:11: $finish called at 20 (1s)
*/
