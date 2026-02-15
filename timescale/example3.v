`timescale 1ns/10ps
module example3;
integer a;
initial begin
    a=0;
    repeat (5) begin
        #1 a = a + 1;
        $display("time = %0t | a = %0d with `timescale 1ns/10ps", $time, a);
    end
    $finish;
end
initial begin
    $dumpfile("example3.vcd");
    $dumpvars(0,example3);
end
endmodule

/*
VCD info: dumpfile example3.vcd opened for output.
time = 100 | a = 1 with `timescale 1ns/10ps
time = 200 | a = 2 with `timescale 1ns/10ps
time = 300 | a = 3 with `timescale 1ns/10ps
time = 400 | a = 4 with `timescale 1ns/10ps
time = 500 | a = 5 with `timescale 1ns/10ps
example3.v:10: $finish called at 500 (10ps)
*/
