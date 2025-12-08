module tristate_buffer_tb;
reg data;
reg enable;
wire out;
tristate_buffer dut(data,enable,out);
initial begin
    enable=0;data=0;#5
    enable=1;data=0;#5
    enable=0;data=1;#5
    enable=1;data=1;#5
    enable=0;data=1;#5
    $finish;
end
initial begin
    $monitor("enable=%b data=%b out=%b",enable,data,out);
end
endmodule

/*
* OUTPUT
enable=0 data=0 out=z
enable=1 data=0 out=0
enable=0 data=1 out=z
enable=1 data=1 out=1
enable=0 data=1 out=z
tristate_buffer_tb.v:12: $finish called at 25 (1s)
* 
*/
