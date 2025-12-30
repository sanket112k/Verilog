module function_example_tb;
reg [7:0]in;
wire pbit;

function_example dut(in, pbit);

initial begin
    in = 0;#5;
    repeat (20) #5 in = in +1;
    $finish;
end
initial begin
    $monitor("in=%b pbit=%b",in,pbit);
end
endmodule

/*
* OUTPUT
in=00000000 pbit=0
in=00000001 pbit=1
in=00000010 pbit=1
in=00000011 pbit=0
in=00000100 pbit=1
in=00000101 pbit=0
in=00000110 pbit=0
in=00000111 pbit=1
in=00001000 pbit=1
in=00001001 pbit=0
in=00001010 pbit=0
in=00001011 pbit=1
in=00001100 pbit=0
in=00001101 pbit=1
in=00001110 pbit=1
in=00001111 pbit=0
in=00010000 pbit=1
in=00010001 pbit=0
in=00010010 pbit=0
in=00010011 pbit=1
function_example_tb.v:10: $finish called at 105 (1s)
in=00010100 pbit=0
* 
*/
