module _2x4_decoder_tb;
reg [1:0]in;
wire [3:0]out;
integer i;
_2x4_decoder dut(in,out);
initial begin
    for(i=0;i<4;i=i+1) begin
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
_2x4_decoder_tb.v:10: $finish called at 20 (1s)
*/
