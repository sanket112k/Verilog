module encoder_tb;
reg [7:0]in;
wire [2:0]out;

encoder dut(in,out);
initial begin
    repeat(30) begin
        in = $urandom_range(8'h00,8'hff); #10;
    end
    $finish;
end
initial begin
    $monitor("in=%b out=%b",in,out);
end
endmodule

/*
in=10010010 out=111
in=01000000 out=110
in=00000100 out=010
in=00110001 out=101
in=10000110 out=111
in=11000110 out=111
in=00110010 out=101
in=00001001 out=011
in=10000000 out=111
in=10000110 out=111
in=10111011 out=111
in=10011110 out=111
in=11110110 out=111
in=11000110 out=111
in=11111100 out=111
in=01100011 out=110
in=01100010 out=110
in=01010101 out=110
in=11110010 out=111
in=00111011 out=101
in=00001001 out=011
in=11000111 out=111
in=11111001 out=111
in=01100111 out=110
in=01110100 out=110
in=01100010 out=110
in=10101110 out=111
in=01011110 out=110
in=00010110 out=100
in=00110010 out=101
encoder_tb.v:10: $finish called at 300 (1s)
*/
