module full_subtractor(
    input a,b,bin,
    output bout,diff
);
assign {bout,diff}=a-b-bin;
endmodule
