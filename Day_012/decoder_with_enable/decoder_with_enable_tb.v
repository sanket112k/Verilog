module decoder_with_enable_tb;
parameter N=4;
reg [$clog2(N)-1:0]in;
reg enable;
wire [N-1:0]out;
integer i;
decoder_with_enable #(.N(N)) dut(in,enable,out);
initial begin
    enable=1'b0;#10
    enable=1'b1;
    for(i=0;i<N;i=i+1) begin
        in=i;#5;
    end
    enable=1'b0; #10
    $finish;
end
initial begin
    $monitor("input=%b enable=%b output=%b",in,enable,out);
end
endmodule

/*
* OUTPUT
input=xx enable=0 output=0000
input=00 enable=1 output=0001
input=01 enable=1 output=0010
input=10 enable=1 output=0100
input=11 enable=1 output=1000
input=11 enable=0 output=0000
decoder_with_enable_tb.v:15: $finish called at 40 (1s)
*/
