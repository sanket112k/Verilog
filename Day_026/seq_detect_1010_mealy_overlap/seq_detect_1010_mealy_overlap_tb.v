module seq_detect_1010_mealy_overlap_tb;
reg clk, reset, in;
wire out;

seq_detect_1010_mealy_overlap dut(clk, reset, in, out);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    repeat (5) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end

    repeat (2) @(negedge clk) reset = 1;

    repeat (15) @(negedge clk) begin
        reset = 0;
        in = ~in;
    end

    repeat (5) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b in=%b out=%b", $time, clk, reset, in, out);
    $dumpfile("seq_detect_1010_mealy_overlap.vcd");
    $dumpvars(0,seq_detect_1010_mealy_overlap_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile seq_detect_1010_mealy_overlap.vcd opened for output.
t=0 clk=0 reset=1 in=x out=x
t=5 clk=1 reset=1 in=x out=0
t=10 clk=0 reset=0 in=1 out=0
t=15 clk=1 reset=0 in=1 out=0
t=20 clk=0 reset=0 in=0 out=0
t=25 clk=1 reset=0 in=0 out=0
t=30 clk=0 reset=0 in=0 out=0
t=35 clk=1 reset=0 in=0 out=0
t=40 clk=0 reset=0 in=0 out=0
t=45 clk=1 reset=0 in=0 out=0
t=50 clk=0 reset=0 in=1 out=0
t=55 clk=1 reset=0 in=1 out=0
t=60 clk=0 reset=1 in=1 out=0
t=65 clk=1 reset=1 in=1 out=0
t=70 clk=0 reset=1 in=1 out=0
t=75 clk=1 reset=1 in=1 out=0
t=80 clk=0 reset=0 in=0 out=0
t=85 clk=1 reset=0 in=0 out=0
t=90 clk=0 reset=0 in=1 out=0
t=95 clk=1 reset=0 in=1 out=0
t=100 clk=0 reset=0 in=0 out=0
t=105 clk=1 reset=0 in=0 out=0
t=110 clk=0 reset=0 in=1 out=0
t=115 clk=1 reset=0 in=1 out=1
t=120 clk=0 reset=0 in=0 out=0
t=125 clk=1 reset=0 in=0 out=0
t=130 clk=0 reset=0 in=1 out=0
t=135 clk=1 reset=0 in=1 out=1
t=140 clk=0 reset=0 in=0 out=0
t=145 clk=1 reset=0 in=0 out=0
t=150 clk=0 reset=0 in=1 out=0
t=155 clk=1 reset=0 in=1 out=1
t=160 clk=0 reset=0 in=0 out=0
t=165 clk=1 reset=0 in=0 out=0
t=170 clk=0 reset=0 in=1 out=0
t=175 clk=1 reset=0 in=1 out=1
t=180 clk=0 reset=0 in=0 out=0
t=185 clk=1 reset=0 in=0 out=0
t=190 clk=0 reset=0 in=1 out=0
t=195 clk=1 reset=0 in=1 out=1
t=200 clk=0 reset=0 in=0 out=0
t=205 clk=1 reset=0 in=0 out=0
t=210 clk=0 reset=0 in=1 out=0
t=215 clk=1 reset=0 in=1 out=1
t=220 clk=0 reset=0 in=0 out=0
t=225 clk=1 reset=0 in=0 out=0
t=230 clk=0 reset=0 in=1 out=0
t=235 clk=1 reset=0 in=1 out=1
t=240 clk=0 reset=0 in=0 out=0
t=245 clk=1 reset=0 in=0 out=0
t=250 clk=0 reset=0 in=0 out=0
t=255 clk=1 reset=0 in=0 out=0
t=260 clk=0 reset=0 in=1 out=0
t=265 clk=1 reset=0 in=1 out=0
seq_detect_1010_mealy_overlap_tb.v:28: $finish called at 270 (1s)
t=270 clk=0 reset=0 in=1 out=0
*/ 

