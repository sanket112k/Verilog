module bcd_to_xs3_tb;
parameter N=3;
reg [N*4-1:0]bcd_in;
wire [N*4-1:0]xs3_out;
nbit_bcd_to_xs3 #(.N(N)) dut1(bcd_in,xs3_out);
integer i,j;
initial begin
    for(i=0;i<N;i=i+1) begin
        for(j=0;j<10;j=j+1) bcd_in[i*4+3 +: 4]=j;#10;
    end
end
initial begin
    $monitor("bcd_in=%b xs3_out=%b",bcd_in,xs3_out);
end
endmodule

