module nxlog2n_priority_encoder #(parameter N=4)(
    input [N-1:0]in,
    output reg [$clog2(N)-1:0]out
);
integer i;
always @(*) begin
    for(i=0;i<N;i=i+1) begin
        if(in[i]===1'b1) begin
            out<=i;
            i<=N;
        end
        else out=1'bz;
    end
end
endmodule
