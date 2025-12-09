module _4x2_priority_encoder_tb;
reg [3:0]in;
wire [1:0]out;
integer i;
_4x2_priority_encoder dut(in,out);
initial begin
    in={4{1'b0}};
    for(i=0;i<4;i=i+1) begin
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
input=0001 output=00
input=001x output=01
input=01xx output=10
input=1xxx output=11
_4x2_priority_encoder_tb.v:11: $finish called at 40 (1s)
* 
*/
