module synchronous_fifo #(
    parameter DEPTH = 8,
    parameter DATA_WIDTH = 8)(
    input clk,
    input resetn,
    input w_en,
    input r_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,
    output empty
);
localparam ADDR_WIDTH = $clog2(DEPTH);

reg [ADDR_WIDTH:0] w_ptr;   // one extra MSB bit to detect wrap around
reg [ADDR_WIDTH:0] r_ptr;
reg [DATA_WIDTH-1:0] fifo [0:DEPTH-1];


always @(posedge clk) begin:write_logic
    if (!resetn)
        w_ptr <= 0;
    else if (w_en && !full) begin
        fifo [w_ptr[ADDR_WIDTH-1:0]] <= data_in;
        w_ptr <= w_ptr + 1;
    end
end

always @(posedge clk) begin:read_logic
    if (!resetn) begin
        r_ptr <= 0;
        data_out <= 0;
    end
    else if (r_en && !empty) begin
        data_out <= fifo [r_ptr[ADDR_WIDTH-1:0]];
        r_ptr <= r_ptr + 1;
    end
end

assign empty = (w_ptr == r_ptr);

assign full  = (w_ptr[ADDR_WIDTH]     != r_ptr[ADDR_WIDTH]) &&
               (w_ptr[ADDR_WIDTH-1:0] == r_ptr[ADDR_WIDTH-1:0]);

endmodule
