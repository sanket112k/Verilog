module adder_tb;
parameter N=8;
reg [N-1:0]a,b;
wire [N-1:0]sum;
wire carry;

adder #(.N(N)) dut(a,b,sum,carry);

initial begin
    
    repeat(20) begin
        a = $urandom_range({N{1'b0}},{N{1'b1}});
        b = $urandom_range({N{1'b0}},{N{1'b1}});
        $strobe("a=%b b=%b sum=%b, carry=%b",a,b,sum,carry);#10;
    end

    $finish;
end
initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,adder_tb);
end
endmodule
