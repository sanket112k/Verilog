module unsized_numbers;
reg integer unsized_bi;
reg integer unsized_hex;
reg integer unsized_dec;
reg integer unsized_oct;
initial begin
    unsized_bi='b101001;
    unsized_dec=12122025;
    unsized_oct='o23561;
    unsized_hex='hea75;#10
    unsized_bi='b011010;
    unsized_dec=0008;
    unsized_oct='o52376;
    unsized_hex='hfb17;#10
    $finish;
end
initial begin
    $dumpfile("unsized_numbers.vcd");
    $dumpvars(0,unsized_numbers);
    $monitor("unsized_bi=%b     unsized_dec=%0d     unsized_oct=%o      unsized_hex=%h",unsized_bi,unsized_dec,unsized_oct,unsized_hex);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile unsized_numbers.vcd opened for output.
unsized_bi=00000000000000000000000000101001     unsized_dec=12122025     unsized_oct=00000023561      unsized_hex=0000ea75
unsized_bi=00000000000000000000000000011010     unsized_dec=8     unsized_oct=00000052376      unsized_hex=0000fb17
unsized_numbers.v:15: $finish called at 20 (1s)
*/ 
