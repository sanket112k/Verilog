module nbit_gray_to_binary_tb;
parameter N=4;
reg [N-1:0]gray_in;
wire [N-1:0]bin_out;
integer i,j,bin_temp;
nbit_gray_to_binary #(
    .N(N)
) dut(
    .gray_in(gray_in),
    .bin_out(bin_out)
);
initial begin
    for(i=0;i<=(2**N)-1;i=i+1) begin
        bin_temp=i;
        gray_in[N-1]=bin_temp[N-1];
        for(j=N-2;j>=0;j=j-1) begin
            gray_in[j]=bin_temp[j+1]^bin_temp[j];
        end
        #10 $display("gray_in=%b bin_out=%b",gray_in,bin_out);
    end
    $finish;
end
endmodule

/*
* OUTPUT
gray_in=0000 bin_out=0000
gray_in=0001 bin_out=0001
gray_in=0011 bin_out=0010
gray_in=0010 bin_out=0011
gray_in=0110 bin_out=0100
gray_in=0111 bin_out=0101
gray_in=0101 bin_out=0110
gray_in=0100 bin_out=0111
gray_in=1100 bin_out=1000
gray_in=1101 bin_out=1001
gray_in=1111 bin_out=1010
gray_in=1110 bin_out=1011
gray_in=1010 bin_out=1100
gray_in=1011 bin_out=1101
gray_in=1001 bin_out=1110
gray_in=1000 bin_out=1111
nbit_gray_to_binary_tb.v:21: $finish called at 160 (1s)
* 
*/
