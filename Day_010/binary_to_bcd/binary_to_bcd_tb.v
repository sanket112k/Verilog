module binary_to_bcd_tb;
parameter N=10;
parameter D=(N*30103)/100000 + 1;
reg [N-1:0]bin_in;
wire [D*4-1:0]bcd_out;
integer i;
binary_to_bcd #(
    .N(N), 
    .D(D)
) dut(
    .bin_in(bin_in),
    .bcd_out(bcd_out)
);
initial begin
    for(i=0;i<=(2**N)-1;i=i+1) begin
        bin_in=i;
        #10 $display("bin_in=%b bcd_out=%b",bin_in,bcd_out);

    end
    $finish;
end
endmodule
