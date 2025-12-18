module dff_tb;
reg clk,d;
wire q;
dff dut(clk,d,q);
initial begin
    forever #5 clk=~clk;
    clk = 0;
    d = 0;
    repeat (10) begin
        d = $urandom_range(0,1);
        #3;
    end
    $finish;
end
initial begin
    $monitor($time," clk=%b d=%b q=%b",clk,d,q);
    $dumpfile("dff.vcd");
    $dumpvars(0,dff_tb);
end
endmodule
