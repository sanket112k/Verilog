module powers_of_2;
wire [4:0] in = 6;
integer i;
initial begin
    for (i = 0; i < 5; i = i+1) begin
        if (in == 2**i) $display("input is power of 2");
    end
$display ("input is not power of 2");
end
endmodule

/*
OUTPUT:
input is not power of 2
*/
