module _8bit_dff_tb;
reg clk;
reg [7:0]d;
wire [7:0]q;
_8bit_dff dut(clk,d,q);
initial begin
    clk = 0; d = 0;
    forever #5 clk = ~clk;
end
initial begin
    repeat (10) begin
        d = $urandom_range(8'h00,8'hff);
        #5;
    end
    $finish;
end
initial begin
    $monitor($time," clk=%b d=%b q=%b",clk,d,q);
    $dumpfile("_8bit_dff.vcd");
    $dumpvars(0,_8bit_dff_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile _8bit_dff.vcd opened for output.
                   0 clk=0 d=10010010 q=xxxxxxxx
                   5 clk=1 d=01000000 q=01000000
                  10 clk=0 d=00000100 q=01000000
                  15 clk=1 d=00110001 q=00110001
                  20 clk=0 d=10000110 q=00110001
                  25 clk=1 d=11000110 q=11000110
                  30 clk=0 d=00110010 q=11000110
                  35 clk=1 d=00001001 q=00001001
                  40 clk=0 d=10000000 q=00001001
                  45 clk=1 d=10000110 q=10000110
_8bit_dff_tb.v:15: $finish called at 50 (1s)
* 
*/
