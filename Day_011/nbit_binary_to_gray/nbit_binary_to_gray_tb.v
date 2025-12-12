module nbit_binary_to_gray_tb;
parameter N=4;
reg [N-1:0]bin_in;
wire [N-1:0]gray_out;
integer i;
nbit_binary_to_gray #(
    .N(N)
) dut(
    .bin_in(bin_in),
    .gray_out(gray_out)
);
initial begin
    for(i=0;i<=(2**N)-1;i=i+1) begin
        bin_in=i;
        #10 $display("bin_in=%b gray_out=%b",bin_in,gray_out);

    end
    $finish;
end
endmodule

/*
* OUTPUT
bin_in=0000 gray_out=0000
bin_in=0001 gray_out=0001
bin_in=0010 gray_out=0011
bin_in=0011 gray_out=0010
bin_in=0100 gray_out=0110
bin_in=0101 gray_out=0111
bin_in=0110 gray_out=0101
bin_in=0111 gray_out=0100
bin_in=1000 gray_out=1100
bin_in=1001 gray_out=1101
bin_in=1010 gray_out=1111
bin_in=1011 gray_out=1110
bin_in=1100 gray_out=1010
bin_in=1101 gray_out=1011
bin_in=1110 gray_out=1001
bin_in=1111 gray_out=1000
nbit_binary_to_gray_tb.v:18: $finish called at 160 (1s)
* 
*/
