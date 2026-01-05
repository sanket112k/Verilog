`timescale 1ns/1ps
module single_port_sync_ram_tb;
reg [7:0] data_in;
reg [5:0] ram_address;
reg write_enable;
reg clk;
wire [7:0] data_out;

single_port_sync_ram dut(
    .data_in(data_in),
    .ram_address(ram_address),
    .write_enable(write_enable),
    .clk(clk),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    write_enable = 0;
    data_in = 0;
    ram_address = 0;

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
    $dumpfile("single_port_sync_ram.vcd");
    $dumpvars(0,single_port_sync_ram_tb);
end

task write_operation;
    input [5:0] addr;
    input [7:0] data;
    begin
        ram_address = addr;
        data_in = data;
        write_enable = 1;
        #10;    //wait for clk
        write_enable = 0;
    end
endtask

task read_operation;
    input [5:0] addr;
    begin
        ram_address = addr;
        write_enable = 0;
        #10;    //wait for clk
        $display("read data at address %h: %h", addr, data_out);
    end
endtask
endmodule
