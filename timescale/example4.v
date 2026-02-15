`timescale 10ns/1ps
module example4;
integer a;
initial begin
    a=0;
    repeat (5) begin
        #1 a = a + 1;
        $display("time = %0t | a = %0d with `timescale 10ns/1ps", $time, a);
    end
    $finish;
end
initial begin
    $dumpfile("example4.vcd");
    $dumpvars(0,example4);
end
endmodule

/*
VCD info: dumpfile example4.vcd opened for output.
time = 10000 | a = 1 with `timescale 10ns/1ps
time = 20000 | a = 2 with `timescale 10ns/1ps
time = 30000 | a = 3 with `timescale 10ns/1ps
time = 40000 | a = 4 with `timescale 10ns/1ps
time = 50000 | a = 5 with `timescale 10ns/1ps
example4.v:10: $finish called at 50000 (1ps)
*/
