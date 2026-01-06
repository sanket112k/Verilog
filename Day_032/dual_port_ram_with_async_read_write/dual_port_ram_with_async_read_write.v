module dual_port_ram_with_async_read_write(
    inout [DATA_WIDTH-1:0] data0,       //input and output data line
    input [ADDR_WIDTH-1:0] ram_address0,
    input write_enable0,
    input chip_select0,
    input out_enable0,
    inout [DATA_WIDTH-1:0] data1,       //input and output data line
    input [ADDR_WIDTH-1:0] ram_address1,
    input write_enable1,
    input chip_select1,
    input out_enable1
);

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 8;
parameter RAM_DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] ram_memory[0:RAM_DEPTH-1];
reg [DATA_WIDTH-1:0] data_reg0;
reg [DATA_WIDTH-1:0] data_reg1;
//reg out_enable_reg;

always @ (ram_address0 or chip_select0 or write_enable0 or data0) begin:Memory_write0
   if (chip_select0 && write_enable0) ram_memory[ram_address0] <= data0;
end

always @ (ram_address1 or chip_select1 or write_enable1 or data1) begin:Memory_write1
   if (chip_select1 && write_enable1) ram_memory[ram_address1] <= data1;
end

always @ (ram_address0 or chip_select0 or write_enable0 or out_enable0) begin:Memory_read0
    if(chip_select0 && out_enable0 && !write_enable0) data_reg0 <= ram_memory[ram_address0];
    else data_reg0 <= 0;
end

assign data0 = (chip_select0 && out_enable0 && !write_enable0) ? data_reg0 : 8'bz;

always @ (ram_address1 or chip_select1 or write_enable1 or out_enable1) begin:Memory_read1
    if(chip_select1 && out_enable1 && !write_enable1) data_reg1 <= ram_memory[ram_address1];
    else data_reg1 <= 0;
end

assign data1 = (chip_select1 && out_enable1 && !write_enable1) ? data_reg1 : 8'bz;

endmodule
