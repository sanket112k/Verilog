module _4x2_priority_encoder_tb;
reg [3:0]in;
wire [1:0]out;
wire valid;
integer i;
_4x2_priority_encoder dut(in,out,valid);
initial begin
    in={4{1'b0}};#10
    for(i=0;i<4;i=i+1) begin
        in[i]=1'b1;in[i-1]=1'bx;#10;
    end
    in={4{1'b0}};#10
    $finish;
end
initial begin
    $monitor("input=%b valid=%b output=%b",in,valid,out);
end
endmodule

/*
* OUTPUT
input=0000 valid=0 output=xx
input=0001 valid=1 output=00
input=001x valid=1 output=01
input=01xx valid=1 output=10
input=1xxx valid=1 output=11
input=0000 valid=0 output=xx
_4x2_priority_encoder_tb.v:13: $finish called at 60 (1s)
* 
*/
