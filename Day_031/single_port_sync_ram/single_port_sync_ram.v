module single_port_sync_ram(
    input clk,
    input [7:0] data_in,
    input [5:0] ram_address,
    input write_enable,
    output [7:0] data_out
);

reg [7:0] ram_memory[31:0];
reg [5:0] address_register;

always @ (posedge clk) begin
   if (write_enable) ram_memory[ram_address] <= data_in;
   else address_register <= ram_address;
end

assign data_out = ram_memory[address_register];

endmodule
