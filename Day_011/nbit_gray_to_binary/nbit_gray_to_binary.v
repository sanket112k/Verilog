module nbit_gray_to_binary #(parameter N=4)(
    input [N-1:0]gray_in,
    output reg [N-1:0]bin_out
);
integer i;
always @(*) begin
    bin_out[N-1]=gray_in[N-1];
    for(i=N-2;i>=0;i=i-1) begin
        bin_out[i]=bin_out[i+1]^gray_in[i];
    end
end
endmodule
