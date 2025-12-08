module adder_with_subtractor_4bit(
    input [3:0]a,bin,
    input m,
    output cout,
    output [3:0]sum
);
wire [4:1]c;
wire [3:0]b;
wire cin;
assign cin=m;
assign b=m?~bin:bin;
assign {c[1],sum[0]}=a[0]+b[0]+cin;
assign {c[2],sum[1]}=a[1]+b[1]+c[1];
assign {c[3],sum[2]}=a[2]+b[2]+c[2];
assign {c[4],sum[3]}=a[3]+b[3]+c[3];
assign cout=c[4];
endmodule
