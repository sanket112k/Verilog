module _7_segment_decoder_tb;
parameter N=4;
reg [N-1:0]in;
wire a,b,c,d,e,f,g;
integer i;
_7_segment_decoder dut(in,a,b,c,d,e,f,g);
initial begin
    for(i=0;i<=(2**N)-1;i=i+1) begin
        in=i;
        #10 $display("in=%h a,b,c,d,e,f,g=%b%b%b%b%b%b%b",in,a,b,c,d,e,f,g);
    end
    $finish;
end
endmodule

/*
* OUTPUT
in=0 a,b,c,d,e,f,g=1111110
in=1 a,b,c,d,e,f,g=0110000
in=2 a,b,c,d,e,f,g=1101101
in=3 a,b,c,d,e,f,g=1111001
in=4 a,b,c,d,e,f,g=0110011
in=5 a,b,c,d,e,f,g=1011011
in=6 a,b,c,d,e,f,g=1011111
in=7 a,b,c,d,e,f,g=1110000
in=8 a,b,c,d,e,f,g=1111111
in=9 a,b,c,d,e,f,g=1111011
in=a a,b,c,d,e,f,g=1110111
in=b a,b,c,d,e,f,g=0011111
in=c a,b,c,d,e,f,g=1001110
in=d a,b,c,d,e,f,g=0111101
in=e a,b,c,d,e,f,g=1001111
in=f a,b,c,d,e,f,g=1000111
_7_segment_decoder_tb.v:12: $finish called at 160 (1s)
* 
*/
