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

/*
OUTPUT:
Time=0 | w_en=0 r_en=0 data_in=00 data_out=xx full=x empty=x
Time=5000 | w_en=0 r_en=0 data_in=00 data_out=00 full=0 empty=1
Writing to FIFO
Time=25000 | w_en=1 r_en=0 data_in=24 data_out=00 full=0 empty=0
Time=35000 | w_en=1 r_en=0 data_in=81 data_out=00 full=0 empty=0
Time=45000 | w_en=1 r_en=0 data_in=09 data_out=00 full=0 empty=0
Time=55000 | w_en=1 r_en=0 data_in=63 data_out=00 full=0 empty=0
Time=65000 | w_en=1 r_en=0 data_in=0d data_out=00 full=0 empty=0
Time=75000 | w_en=1 r_en=0 data_in=8d data_out=00 full=0 empty=0
Time=85000 | w_en=1 r_en=0 data_in=65 data_out=00 full=0 empty=0
Time=95000 | w_en=1 r_en=0 data_in=12 data_out=00 full=1 empty=0
Time=105000 | w_en=0 r_en=0 data_in=12 data_out=00 full=1 empty=0
Time=115000 | w_en=1 r_en=0 data_in=aa data_out=00 full=1 empty=0
Reading from FIFO
Time=125000 | w_en=0 r_en=0 data_in=aa data_out=00 full=1 empty=0
Time=135000 | w_en=0 r_en=1 data_in=aa data_out=24 full=0 empty=0
Time=145000 | w_en=0 r_en=1 data_in=aa data_out=81 full=0 empty=0
Time=155000 | w_en=0 r_en=1 data_in=aa data_out=09 full=0 empty=0
Time=165000 | w_en=0 r_en=1 data_in=aa data_out=63 full=0 empty=0
Time=175000 | w_en=0 r_en=1 data_in=aa data_out=0d full=0 empty=0
Time=185000 | w_en=0 r_en=1 data_in=aa data_out=8d full=0 empty=0
Time=195000 | w_en=0 r_en=1 data_in=aa data_out=65 full=0 empty=0
Time=205000 | w_en=0 r_en=1 data_in=aa data_out=12 full=0 empty=1
Simultanious Read/Write
Time=215000 | w_en=0 r_en=0 data_in=aa data_out=12 full=0 empty=1
Time=225000 | w_en=1 r_en=1 data_in=01 data_out=12 full=0 empty=0
Time=235000 | w_en=1 r_en=1 data_in=0d data_out=01 full=0 empty=0
Time=245000 | w_en=1 r_en=1 data_in=76 data_out=0d full=0 empty=0
Time=255000 | w_en=1 r_en=1 data_in=3d data_out=76 full=0 empty=0
Time=265000 | w_en=1 r_en=1 data_in=ed data_out=3d full=0 empty=0
Time=275000 | w_en=0 r_en=0 data_in=ed data_out=3d full=0 empty=0
synchronous_fifo_tb.v:79: $finish called at 325000 (1ps)
*/
