`timescale 1ns/1ps
module single_port_sync_ram1_tb;
wire [7:0] data;
reg [5:0] ram_address;
reg write_enable;
reg clk;
reg chip_select;
reg out_enable;

single_port_sync_ram1 dut(
    .data(data),
    .ram_address(ram_address),
    .write_enable(write_enable),
    .clk(clk),
    .chip_select(chip_select),
    .out_enable(out_enable)
);

reg [7:0]tb_data_out;
reg tb_data_enable;
assign data = tb_data_enable ? 8'bz : tb_data_out;
always #5 clk = ~clk;

initial begin
    clk = 0;
    write_enable = 0;
    tb_data_out = 8'bz;
    tb_data_enable = 1;
    ram_address = 0;
    chip_select = 1;
    out_enable = 0;

    #10;
    write_operation(6'h00, 8'hAA);
    write_operation(6'h0A, 8'h55);
    write_operation(6'h0B, 8'h50);
    write_operation(6'h0C, 8'h05);

    #10;
    read_operation(6'h00);
    read_operation(6'h0A);
    read_operation(6'h0B);
    read_operation(6'h0C);

    #10
    $finish;
end

initial begin
    $dumpfile("single_port_sync_ram1.vcd");
    $dumpvars(0,single_port_sync_ram1_tb);
end

task write_operation;
    input [5:0] addr;
    input [7:0] in;
    begin
        ram_address = addr;
        tb_data_out = in;
        write_enable = 1;
        tb_data_enable = 0;
        #10;    //wait for clk
        write_enable = 0;
        //tb_data_out = 8'bz;
        tb_data_enable = 1;
    end
endtask

task read_operation;
    input [5:0] addr;
    begin
        ram_address = addr;
        write_enable = 0;
        out_enable = 1;
        tb_data_enable = 1;
        #10;    //wait for clk
        $display("read data at address %h: %h", addr, data);
        out_enable = 0;
        //tb_data_enable = 0;
    end
endtask
endmodule
