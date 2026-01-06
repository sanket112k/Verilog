`timescale 1ns/1ps
module dual_port_ram_with_sync_read_write_tb;
reg clk;
wire [7:0] data0;
reg [7:0] ram_address0;
reg write_enable0;
reg chip_select0;
reg out_enable0;
wire [7:0] data1;
reg [7:0] ram_address1;
reg write_enable1;
reg chip_select1;
reg out_enable1;

dual_port_ram_with_sync_read_write dut(
    .clk(clk),
    .data0(data0),
    .ram_address0(ram_address0),
    .write_enable0(write_enable0),
    .chip_select0(chip_select0),
    .out_enable0(out_enable0),
    .data1(data1),
    .ram_address1(ram_address1),
    .write_enable1(write_enable1),
    .chip_select1(chip_select1),
    .out_enable1(out_enable1)
);

reg [7:0]tb_data_out0;
reg tb_data_enable0;
assign data0 = tb_data_enable0 ? 8'bz : tb_data_out0;

reg [7:0]tb_data_out1;
reg tb_data_enable1;
assign data1 = tb_data_enable1 ? 8'bz : tb_data_out1;

always #5 clk = ~clk;

initial begin
    clk = 0;
    write_enable0 = 0;
    tb_data_out0 = 8'bz;
    tb_data_enable0 = 1;
    ram_address0 = 0;
    chip_select0 = 1;
    out_enable0 = 0;
    write_enable1 = 0;
    tb_data_out1 = 8'bz;
    tb_data_enable1 = 1;
    ram_address1 = 0;
    chip_select1 = 1;
    out_enable1 = 0;

    #10;
    write_operation(6'h00, 8'hAA, 6'h10, 8'hBB);
    write_operation(6'h0A, 8'h55, 6'h1A, 8'h66);
    write_operation(6'h0B, 8'h50, 6'h1B, 8'h60);
    write_operation(6'h0C, 8'h05, 6'h1C, 8'h06);

    #10;
    read_operation(6'h00, 6'h10);
    read_operation(6'h0A, 6'h1A);
    read_operation(6'h0B, 6'h1B);
    read_operation(6'h0C, 6'h1C);

    #10
    $finish;
end

initial begin
    $dumpfile("dual_port_ram_with_sync_read_write.vcd");
    $dumpvars(0,dual_port_ram_with_sync_read_write_tb);
end

task write_operation;
    input [7:0] addr0;
    input [7:0] in0;

    input [7:0] addr1;
    input [7:0] in1;

    begin
        ram_address0 = addr0;
        tb_data_out0 = in0;
        write_enable0 = 1;
        tb_data_enable0 = 0;

        ram_address1 = addr1;
        tb_data_out1 = in1;
        write_enable1 = 1;
        tb_data_enable1 = 0;

        #10;    //wait for clk

        write_enable0 = 0;
        tb_data_enable0 = 1;

        write_enable1 = 0;
        tb_data_enable1 = 1;
    end
endtask

task read_operation;
    input [5:0] addr0;
    input [5:0] addr1;
    begin
        ram_address0 = addr0;
        write_enable0 = 0;
        out_enable0 = 1;
        tb_data_enable0 = 1;

        ram_address1 = addr1;
        write_enable1 = 0;
        out_enable1 = 1;
        tb_data_enable1 = 1;

        #10;    //wait for clk
        $display("read data at address %h: %h   read data at address %h: %h", addr0, data0, addr1, data1);
        out_enable0 = 0;
        out_enable1 = 0;
    end
endtask
endmodule
