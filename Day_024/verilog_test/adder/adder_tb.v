module adder_tb;
reg [3:0]a,b;
wire [3:0]sum;
wire carry;

adder dut(a,b,sum,carry);

initial begin
    
    repeat(20) begin
        a = $urandom_range(4'h0,4'hf);
        b = $urandom_range(4'h0,4'hf); #10;
    end

    $finish;
end
initial begin
    $monitor("a=%b b=%b sum=%b, carry=%b",a,b,sum,carry);
    $dumpfile("adder.vcd");
    $dumpvars(0,adder_tb);
end
endmodule
