module nxlog2n_priority_encoder_tb;
parameter N=8;
reg [N-1:0]in;
wire [$clog2(N)-1:0]out;
wire valid;
integer i;
nxlog2n_priority_encoder #(.N(8)) dut(in,out,valid);
initial begin
    in={N{1'b0}};#10;
    for(i=0;i<N;i=i+1) begin
        if (i==0) begin
            in[i]=1'b1;#10;
        end
        else begin 
            in[i]=1'b1;in[i-1]=1'bx;#10;
        end
    end
    in={N{1'b0}};#10;
    $finish;
end
initial begin
    $monitor("input=%b valid=%b output=%b",in,valid,out);
end
endmodule

/*
* OUTPUT
input=00000000 valid=0 output=xxx
input=00000001 valid=1 output=000
input=0000001x valid=1 output=001
input=000001xx valid=1 output=010
input=00001xxx valid=1 output=011
input=0001xxxx valid=1 output=100
input=001xxxxx valid=1 output=101
input=01xxxxxx valid=1 output=110
input=1xxxxxxx valid=1 output=111
input=00000000 valid=0 output=xxx
nxlog2n_priority_encoder_tb.v:19: $finish called at 100 (1s)
* 
*/
