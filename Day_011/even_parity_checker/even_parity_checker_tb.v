module even_parity_checker_tb;
reg [3:0]in;
reg rx_pbit;
wire error;
even_parity_checker a(in,rx_pbit,error);
initial begin
    in=4'b0000; rx_pbit=0; #10
    in=4'b0001; rx_pbit=1; #10
    in=4'b0010; rx_pbit=1; #10
    in=4'b0011; rx_pbit=0; #10
    in=4'b0100; rx_pbit=0; #10     //error
    in=4'b0101; rx_pbit=0; #10
    in=4'b0110; rx_pbit=0; #10
    in=4'b0111; rx_pbit=1; #10
    in=4'b1000; rx_pbit=1; #10
    in=4'b1001; rx_pbit=0; #10
    in=4'b1010; rx_pbit=1; #10     //error
    in=4'b1011; rx_pbit=1; #10
    in=4'b1100; rx_pbit=0; #10
    in=4'b1101; rx_pbit=1; #10
    in=4'b1110; rx_pbit=1; #10
    in=4'b1111; rx_pbit=1; #10     //error
    $finish;
end
initial begin
    $monitor("in=%b rx_pbit=%b error=%b",in,rx_pbit,error);
end
endmodule

/*
* OUTPUT
in=0000 rx_pbit=0 error=0
in=0001 rx_pbit=1 error=0
in=0010 rx_pbit=1 error=0
in=0011 rx_pbit=0 error=0
in=0100 rx_pbit=0 error=1
in=0101 rx_pbit=0 error=0
in=0110 rx_pbit=0 error=0
in=0111 rx_pbit=1 error=0
in=1000 rx_pbit=1 error=0
in=1001 rx_pbit=0 error=0
in=1010 rx_pbit=1 error=1
in=1011 rx_pbit=1 error=0
in=1100 rx_pbit=0 error=0
in=1101 rx_pbit=1 error=0
in=1110 rx_pbit=1 error=0
in=1111 rx_pbit=1 error=1
even_parity_checker_tb.v:23: $finish called at 160 (1s)
* 
*/
