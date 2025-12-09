module nxlog2n_priority_encoder_tb;
parameter N=8;
reg [N-1:0]in;
wire [$clog2(N)-1:0]out;
integer i;
nxlog2n_priority_encoder #(.N(8)) dut(in,out);
initial begin
    in={N{1'b0}};
    for(i=0;i<N;i=i+1) begin
        in[i]=1'b1;in[i-1]=1'bx;#10;
    end
    $finish;
end
initial begin
    $monitor("input=%b output=%b",in,out);
end
endmodule

/*
* OUTPUT
input=00000001 output=000
input=0000001x output=001
input=000001xx output=010
input=00001xxx output=011
input=0001xxxx output=100
input=001xxxxx output=101
input=01xxxxxx output=110
input=1xxxxxxx output=111
nxlog2n_priority_encoder_tb.v:12: $finish called at 80 (1s)
* 
*/
