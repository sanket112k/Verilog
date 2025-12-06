module _2s_comp_to_sign_mag_tb;
reg signed [3:0]data;
wire [3:0]out;
_2s_comp_to_sign_mag dut(data,out);
initial begin
    data=4'b0000;#5
    data=4'b0001;#5
    data=4'b0010;#5
    data=4'b0011;#5
    data=4'b0100;#5
    data=4'b0101;#5
    data=4'b0110;#5
    data=4'b0111;#5
    data=4'b1000;#5
    data=4'b1001;#5
    data=4'b1010;#5
    data=4'b1011;#5
    data=4'b1100;#5
    data=4'b1101;#5
    data=4'b1110;#5
    data=4'b1111;#5
    $finish;
end
initial begin
    $monitor("data=%b=%0d sign_magnitude_of_data=%b",data,data,out);
end
endmodule

/*
* OUTPUT
data=0000=0 sign_magnitude_of_data=0000
data=0001=1 sign_magnitude_of_data=0001
data=0010=2 sign_magnitude_of_data=0010
data=0011=3 sign_magnitude_of_data=0011
data=0100=4 sign_magnitude_of_data=0100
data=0101=5 sign_magnitude_of_data=0101
data=0110=6 sign_magnitude_of_data=0110
data=0111=7 sign_magnitude_of_data=0111
data=1000=-8 sign_magnitude_of_data=1000
data=1001=-7 sign_magnitude_of_data=1111
data=1010=-6 sign_magnitude_of_data=1110
data=1011=-5 sign_magnitude_of_data=1101
data=1100=-4 sign_magnitude_of_data=1100
data=1101=-3 sign_magnitude_of_data=1011
data=1110=-2 sign_magnitude_of_data=1010
data=1111=-1 sign_magnitude_of_data=1001
_2s_comp_to_sign_mag_tb.v:22: $finish called at 80 (1s)
* 
*/
