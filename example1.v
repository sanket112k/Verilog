`timescale 1ns/1ns
module example1;
integer a;
initial begin
    a=0;
    repeat (5) begin
        #1 a = a + 1;
        $display("time = %0t | a = %0d with `timescale 1ns/1ns", $time, a);
    end
    $finish;
end
initial begin
    $dumpfile("example1.vcd");
    $dumpvars(0,example1);
end
endmodule

/*
VCD info: dumpfile example1.vcd opened for output.
time = 1 | a = 1 with `timescale 1ns/1ns
time = 2 | a = 2 with `timescale 1ns/1ns
time = 3 | a = 3 with `timescale 1ns/1ns
time = 4 | a = 4 with `timescale 1ns/1ns
time = 5 | a = 5 with `timescale 1ns/1ns
example1.v:10: $finish called at 5 (1ns)
*/
