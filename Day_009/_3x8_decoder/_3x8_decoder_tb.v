module _3x8_decoder_tb;
reg [2:0]in;
wire [7:0]out;
integer i;
_3x8_decoder dut(in,out);
initial begin
    for(i=0;i<8;i=i+1) begin
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
input=000 output=00000001
input=001 output=00000010
input=010 output=00000100
input=011 output=00001000
input=100 output=00010000
input=101 output=00100000
input=110 output=01000000
input=111 output=10000000
_3x8_decoder_tb.v:10: $finish called at 40 (1s)
*/
