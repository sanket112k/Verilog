module single_port_async_ram(
    input clk,
    inout [7:0] data,       //input and output data line
    input [5:0] ram_address,
    input write_enable,
    input chip_select,
    input out_enable
);

reg [7:0] ram_memory[31:0];
reg [7:0] data_reg;
reg out_enable_reg;

always @ (posedge clk) begin:Memory_write
   if (chip_select && write_enable) ram_memory[ram_address] <= data;
end

always @ (ram_address or chip_select or out_enable) begin:Memory_read
    if(chip_select && out_enable && !write_enable) data_reg = ram_memory[ram_address];
end

assign data = (chip_select && out_enable && !write_enable) ? data_reg : 8'bz;

endmodule
