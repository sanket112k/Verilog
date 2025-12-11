module binary_to_bcd #(
    parameter N=8,                      // binary width(N),bcd width(D)
    parameter D=(N*30103)/100000 + 1    // ceil(log10(2^N))
)(
    input [N-1:0]bin_in,
    output reg [D*4-1:0]bcd_out
);
integer i,j;
reg [N+D*4-1:0]shift_reg;
always @(*) begin
    shift_reg=0;
    shift_reg[N-1:0]=bin_in;
    for(i=0;i<N;i=i+1) begin
        for(j=0;j<N;j=j+1) begin
            if(shift_reg[N+j*4 +: 4]>=5)
                shift_reg[N+j*4 +: 4] = shift_reg[N+j*4 +: 4] + 3;
        end
        shift_reg=shift_reg<<1;
    end
    bcd_out=shift_reg[N+D*4-1:N];
end
endmodule
