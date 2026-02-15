`timescale 1ns/1ps
module example2;
integer a;
initial begin
    a=0;
    repeat (5) begin
        #1 a = a + 1;
        $display("time = %0t | a = %0d with `timescale 1ns/1ps", $time, a);
    end
    $finish;
end
initial begin
    $dumpfile("example2.vcd");
    $dumpvars(0,example2);
end
endmodule

/*
VCD info: dumpfile example2.vcd opened for output.
time = 1000 | a = 1 with `timescale 1ns/1ps
time = 2000 | a = 2 with `timescale 1ns/1ps
time = 3000 | a = 3 with `timescale 1ns/1ps
time = 4000 | a = 4 with `timescale 1ns/1ps
time = 5000 | a = 5 with `timescale 1ns/1ps
example2.v:10: $finish called at 5000 (1ps)
*/
