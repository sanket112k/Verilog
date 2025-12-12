module parity_generator #(parameter N=7)(
    input [N-1:0]in,
    output reg even_pbit,odd_pbit
);
integer i,temp;
always @(*) begin
    temp=in[0];
    for(i=1;i<N;i=i+1) begin
        temp=in[i]^temp;
    end
    even_pbit=temp;
    odd_pbit=~temp;
end
endmodule
