`timescale 1ns/1ps

module synchronous_fifo_tb;
parameter DEPTH = 8;
parameter DATA_WIDTH = 8;

reg clk;
reg resetn;
reg w_en;
reg r_en;
reg [DATA_WIDTH-1:0] data_in;

wire [DATA_WIDTH-1:0] data_out;
wire full;
wire empty;

synchronous_fifo s_fifo(
    .clk(clk),
    .resetn(resetn),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    resetn = 0;
    w_en = 0;
    r_en = 0;
    data_in = 0;

    #20 resetn = 1;

    $display("Writing to FIFO");

    repeat(8) begin
        @(posedge clk);
        w_en = 1;
        data_in = $random;
    end

    @(posedge clk);
    w_en = 0;

    @(posedge clk);
    w_en = 1;
    data_in = 8'hAA;    // Try writing when FULL

    @(posedge clk);
    w_en = 0;

    $display("Reading from FIFO");
    repeat(8) begin
        @(posedge clk);
        r_en = 1;
    end

    @(posedge clk)
    r_en = 0;

    $display("Simultanious Read/Write");
    repeat(5) begin
        @(posedge clk);
        w_en = 1;
        r_en = 1;
        data_in = $random;
    end

    @(posedge clk);
    w_en = 0;
    r_en = 0;

    #50;
    $finish;
end

initial begin
    $monitor("Time=%0t | w_en=%b r_en=%b data_in=%h data_out=%h full=%b empty=%b",
        $time, w_en, r_en, data_in, data_out, full, empty);
    $dumpfile("synchronous_fifo.vcd");
    $dumpvars(0, synchronous_fifo_tb);
end
endmodule
