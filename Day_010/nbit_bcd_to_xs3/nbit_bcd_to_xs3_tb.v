module nbit_bcd_to_xs3_tb;
parameter N=2;
parameter B=N*$clog2(10);
reg [N*4-1:0]bcd_in;
wire [N*4-1:0]xs3_out;
nbit_bcd_to_xs3 #(.N(N)) dut1(
    .bcd_in(bcd_in),
    .xs3_out(xs3_out)
);
integer i,j,k;
reg [B+N*4:0]shift_reg;
initial begin
    shift_reg=0;
    for(k=0;k<=(2**B)-1;k=k+1) begin
        shift_reg[B-1:0]=k;
        for(i=0;i<B;i=i+1) begin
            for(j=0;j<B;j=j+1) begin
                if(shift_reg[B+j*4 +: 4]>=5)
                    shift_reg[B+j*4 +: 4] = shift_reg[B+j*4 +: 4] + 3;
            end
            shift_reg=shift_reg<<1;
        end
        if(shift_reg[B+N*4]==1) $finish;
        bcd_in<=shift_reg[B+N*4-1:B];#10;
        shift_reg[B+N*4:B]<=0;
    end
    $finish;
end
initial begin
    $monitor("bcd_in=%b xs3_out=%b",bcd_in,xs3_out);
end
endmodule


/*
* OUTPUT
bcd_in=00000000 xs3_out=00110011
bcd_in=00000001 xs3_out=00110100
bcd_in=00000010 xs3_out=00110101
bcd_in=00000011 xs3_out=00110110
bcd_in=00000100 xs3_out=00110111
bcd_in=00000101 xs3_out=00111000
bcd_in=00000110 xs3_out=00111001
bcd_in=00000111 xs3_out=00111010
bcd_in=00001000 xs3_out=00111011
bcd_in=00001001 xs3_out=00111100
bcd_in=00010000 xs3_out=01000011
bcd_in=00010001 xs3_out=01000100
bcd_in=00010010 xs3_out=01000101
bcd_in=00010011 xs3_out=01000110
bcd_in=00010100 xs3_out=01000111
bcd_in=00010101 xs3_out=01001000
bcd_in=00010110 xs3_out=01001001
bcd_in=00010111 xs3_out=01001010
bcd_in=00011000 xs3_out=01001011
bcd_in=00011001 xs3_out=01001100
bcd_in=00100000 xs3_out=01010011
bcd_in=00100001 xs3_out=01010100
bcd_in=00100010 xs3_out=01010101
bcd_in=00100011 xs3_out=01010110
bcd_in=00100100 xs3_out=01010111
bcd_in=00100101 xs3_out=01011000
bcd_in=00100110 xs3_out=01011001
bcd_in=00100111 xs3_out=01011010
bcd_in=00101000 xs3_out=01011011
bcd_in=00101001 xs3_out=01011100
bcd_in=00110000 xs3_out=01100011
bcd_in=00110001 xs3_out=01100100
bcd_in=00110010 xs3_out=01100101
bcd_in=00110011 xs3_out=01100110
bcd_in=00110100 xs3_out=01100111
bcd_in=00110101 xs3_out=01101000
bcd_in=00110110 xs3_out=01101001
bcd_in=00110111 xs3_out=01101010
bcd_in=00111000 xs3_out=01101011
bcd_in=00111001 xs3_out=01101100
bcd_in=01000000 xs3_out=01110011
bcd_in=01000001 xs3_out=01110100
bcd_in=01000010 xs3_out=01110101
bcd_in=01000011 xs3_out=01110110
bcd_in=01000100 xs3_out=01110111
bcd_in=01000101 xs3_out=01111000
bcd_in=01000110 xs3_out=01111001
bcd_in=01000111 xs3_out=01111010
bcd_in=01001000 xs3_out=01111011
bcd_in=01001001 xs3_out=01111100
bcd_in=01010000 xs3_out=10000011
bcd_in=01010001 xs3_out=10000100
bcd_in=01010010 xs3_out=10000101
bcd_in=01010011 xs3_out=10000110
bcd_in=01010100 xs3_out=10000111
bcd_in=01010101 xs3_out=10001000
bcd_in=01010110 xs3_out=10001001
bcd_in=01010111 xs3_out=10001010
bcd_in=01011000 xs3_out=10001011
bcd_in=01011001 xs3_out=10001100
bcd_in=01100000 xs3_out=10010011
bcd_in=01100001 xs3_out=10010100
bcd_in=01100010 xs3_out=10010101
bcd_in=01100011 xs3_out=10010110
bcd_in=01100100 xs3_out=10010111
bcd_in=01100101 xs3_out=10011000
bcd_in=01100110 xs3_out=10011001
bcd_in=01100111 xs3_out=10011010
bcd_in=01101000 xs3_out=10011011
bcd_in=01101001 xs3_out=10011100
bcd_in=01110000 xs3_out=10100011
bcd_in=01110001 xs3_out=10100100
bcd_in=01110010 xs3_out=10100101
bcd_in=01110011 xs3_out=10100110
bcd_in=01110100 xs3_out=10100111
bcd_in=01110101 xs3_out=10101000
bcd_in=01110110 xs3_out=10101001
bcd_in=01110111 xs3_out=10101010
bcd_in=01111000 xs3_out=10101011
bcd_in=01111001 xs3_out=10101100
bcd_in=10000000 xs3_out=10110011
bcd_in=10000001 xs3_out=10110100
bcd_in=10000010 xs3_out=10110101
bcd_in=10000011 xs3_out=10110110
bcd_in=10000100 xs3_out=10110111
bcd_in=10000101 xs3_out=10111000
bcd_in=10000110 xs3_out=10111001
bcd_in=10000111 xs3_out=10111010
bcd_in=10001000 xs3_out=10111011
bcd_in=10001001 xs3_out=10111100
bcd_in=10010000 xs3_out=11000011
bcd_in=10010001 xs3_out=11000100
bcd_in=10010010 xs3_out=11000101
bcd_in=10010011 xs3_out=11000110
bcd_in=10010100 xs3_out=11000111
bcd_in=10010101 xs3_out=11001000
bcd_in=10010110 xs3_out=11001001
bcd_in=10010111 xs3_out=11001010
bcd_in=10011000 xs3_out=11001011
bcd_in=10011001 xs3_out=11001100
nbit_bcd_to_xs3_tb.v:23: $finish called at 1000 (1s)
*/
