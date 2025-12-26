module shift_reg_tb;
reg clk, rst, shift_in;
wire [3:0]led;

shift_reg dut(clk,rst,shift_in,led);

always #10 clk = ~clk;
initial begin
    clk = 0;
    
    repeat(20) @(posedge clk) begin
        rst = 0;
        shift_in = $urandom_range(0,1);
    end
    
    repeat(2) @(posedge clk) rst = 1;
    
    repeat(200) @(posedge clk) begin
        rst = 0;
        shift_in = $urandom_range(0,1);
    end
    $finish;
end
initial begin
    $monitor("rst=%b shift_in=%b led=%b",rst,shift_in,led);
    $dumpfile("shift_reg.vcd");
    $dumpvars(0,shift_reg_tb);
end
endmodule

/*
rst=x shift_in=x led=xxxx
rst=0 shift_in=1 led=1xxx
rst=0 shift_in=0 led=11xx
rst=0 shift_in=0 led=011x
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=1 shift_in=0 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=1 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=0000
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=1 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
rst=0 shift_in=1 led=0011
rst=0 shift_in=0 led=0001
rst=0 shift_in=0 led=0000
rst=0 shift_in=1 led=1000
rst=0 shift_in=0 led=1100
rst=0 shift_in=0 led=0110
rst=0 shift_in=0 led=0011
rst=0 shift_in=1 led=1001
rst=0 shift_in=0 led=1100
rst=0 shift_in=1 led=1110
rst=0 shift_in=0 led=1111
rst=0 shift_in=1 led=1111
rst=0 shift_in=0 led=1111
rst=0 shift_in=0 led=0111
shift_reg_tb.v:22: $finish called at 4430 (1s)
rst=0 shift_in=1 led=0011
*
*/
