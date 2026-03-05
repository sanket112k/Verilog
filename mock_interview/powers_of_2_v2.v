module powers_of_2;
wire [4:0] in = 6;
reg [2:0] sum;
integer i;
initial begin
    sum = in[0] + in[1] + in[2] + in[3] + in[4];
    if (sum == 1) $display("input is power of 2");
    else $display ("input is not power of 2");
end
endmodule

/*
OUTPUT:
input is not power of 2
*/
