`timescale 1ns/1ns;
module uart_tb;
reg clk;
reg [7:0] data;
reg tx_start;
wire tx_done;
wire rx_done;
wire [7:0] data_out;

uart_topmodule dut(
    .clk(clk),
    .data(data),
    .tx_start(tx_start),
    .tx_done(tx_done),
    .data_out(data_out),
    .rx_done(rx_done)
);

always #10 clk = ~clk;

initial begin
   clk = 0;
   data = 8'hff;
   tx_start = 1;
   repeat(10) @(negedge clk);
   tx_start = 1;
   if (rx_done) #20 $finish;
end

initial begin
    $dumpfile("uart.vcd");
    $dumpvars(0,uart_tb);
end
endmodule
