module seq_detect_101_mealy_overlap_tb;
reg clk, reset, in;
wire out;

seq_detect_101_mealy_overlap dut(clk, reset, in, out);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    repeat (5) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end

    repeat (2) @(negedge clk) reset = 1;

    repeat (8) @(negedge clk) begin
        reset = 0;
        in = ~in;
    end

    repeat (50) @(negedge clk) begin
        reset = 0;
        in = $urandom_range(1'b0,1'b1);
    end
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b in=%b out=%b", $time, clk, reset, in, out);
    $dumpfile("seq_detect_101_mealy_overlap.vcd");
    $dumpvars(0,seq_detect_101_mealy_overlap_tb);
end
endmodule

/*
* OUTPUT
VCD info: dumpfile seq_detect_101_mealy_overlap.vcd opened for output.
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
t=110 clk=0 reset=0 in=1 out=1
t=115 clk=1 reset=0 in=1 out=0
t=120 clk=0 reset=0 in=0 out=0
t=125 clk=1 reset=0 in=0 out=0
t=130 clk=0 reset=0 in=1 out=1
t=135 clk=1 reset=0 in=1 out=0
t=140 clk=0 reset=0 in=0 out=0
t=145 clk=1 reset=0 in=0 out=0
t=150 clk=0 reset=0 in=1 out=1
t=155 clk=1 reset=0 in=1 out=0
t=160 clk=0 reset=0 in=1 out=0
t=165 clk=1 reset=0 in=1 out=0
t=170 clk=0 reset=0 in=0 out=0
t=175 clk=1 reset=0 in=0 out=0
t=180 clk=0 reset=0 in=0 out=0
t=185 clk=1 reset=0 in=0 out=0
t=190 clk=0 reset=0 in=1 out=0
t=195 clk=1 reset=0 in=1 out=0
t=200 clk=0 reset=0 in=1 out=0
t=205 clk=1 reset=0 in=1 out=0
t=210 clk=0 reset=0 in=1 out=0
t=215 clk=1 reset=0 in=1 out=0
t=220 clk=0 reset=0 in=1 out=0
t=225 clk=1 reset=0 in=1 out=0
t=230 clk=0 reset=0 in=1 out=0
t=235 clk=1 reset=0 in=1 out=0
t=240 clk=0 reset=0 in=1 out=0
t=245 clk=1 reset=0 in=1 out=0
t=250 clk=0 reset=0 in=1 out=0
t=255 clk=1 reset=0 in=1 out=0
t=260 clk=0 reset=0 in=0 out=0
t=265 clk=1 reset=0 in=0 out=0
t=270 clk=0 reset=0 in=0 out=0
t=275 clk=1 reset=0 in=0 out=0
t=280 clk=0 reset=0 in=0 out=0
t=285 clk=1 reset=0 in=0 out=0
t=290 clk=0 reset=0 in=1 out=0
t=295 clk=1 reset=0 in=1 out=0
t=300 clk=0 reset=0 in=0 out=0
t=305 clk=1 reset=0 in=0 out=0
t=310 clk=0 reset=0 in=0 out=0
t=315 clk=1 reset=0 in=0 out=0
t=320 clk=0 reset=0 in=1 out=0
t=325 clk=1 reset=0 in=1 out=0
t=330 clk=0 reset=0 in=1 out=0
t=335 clk=1 reset=0 in=1 out=0
t=340 clk=0 reset=0 in=0 out=0
t=345 clk=1 reset=0 in=0 out=0
t=350 clk=0 reset=0 in=0 out=0
t=355 clk=1 reset=0 in=0 out=0
t=360 clk=0 reset=0 in=0 out=0
t=365 clk=1 reset=0 in=0 out=0
t=370 clk=0 reset=0 in=1 out=0
t=375 clk=1 reset=0 in=1 out=0
t=380 clk=0 reset=0 in=0 out=0
t=385 clk=1 reset=0 in=0 out=0
t=390 clk=0 reset=0 in=0 out=0
t=395 clk=1 reset=0 in=0 out=0
t=400 clk=0 reset=0 in=0 out=0
t=405 clk=1 reset=0 in=0 out=0
t=410 clk=0 reset=0 in=0 out=0
t=415 clk=1 reset=0 in=0 out=0
t=420 clk=0 reset=0 in=1 out=0
t=425 clk=1 reset=0 in=1 out=0
t=430 clk=0 reset=0 in=0 out=0
t=435 clk=1 reset=0 in=0 out=0
t=440 clk=0 reset=0 in=1 out=1
t=445 clk=1 reset=0 in=1 out=0
t=450 clk=0 reset=0 in=1 out=0
t=455 clk=1 reset=0 in=1 out=0
t=460 clk=0 reset=0 in=0 out=0
t=465 clk=1 reset=0 in=0 out=0
t=470 clk=0 reset=0 in=0 out=0
t=475 clk=1 reset=0 in=0 out=0
t=480 clk=0 reset=0 in=0 out=0
t=485 clk=1 reset=0 in=0 out=0
t=490 clk=0 reset=0 in=0 out=0
t=495 clk=1 reset=0 in=0 out=0
t=500 clk=0 reset=0 in=0 out=0
t=505 clk=1 reset=0 in=0 out=0
t=510 clk=0 reset=0 in=1 out=0
t=515 clk=1 reset=0 in=1 out=0
t=520 clk=0 reset=0 in=0 out=0
t=525 clk=1 reset=0 in=0 out=0
t=530 clk=0 reset=0 in=0 out=0
t=535 clk=1 reset=0 in=0 out=0
t=540 clk=0 reset=0 in=0 out=0
t=545 clk=1 reset=0 in=0 out=0
t=550 clk=0 reset=0 in=1 out=0
t=555 clk=1 reset=0 in=1 out=0
t=560 clk=0 reset=0 in=0 out=0
t=565 clk=1 reset=0 in=0 out=0
t=570 clk=0 reset=0 in=1 out=1
t=575 clk=1 reset=0 in=1 out=0
t=580 clk=0 reset=0 in=1 out=0
t=585 clk=1 reset=0 in=1 out=0
t=590 clk=0 reset=0 in=0 out=0
t=595 clk=1 reset=0 in=0 out=0
t=600 clk=0 reset=0 in=0 out=0
t=605 clk=1 reset=0 in=0 out=0
t=610 clk=0 reset=0 in=1 out=0
t=615 clk=1 reset=0 in=1 out=0
t=620 clk=0 reset=0 in=1 out=0
t=625 clk=1 reset=0 in=1 out=0
t=630 clk=0 reset=0 in=1 out=0
t=635 clk=1 reset=0 in=1 out=0
t=640 clk=0 reset=0 in=0 out=0
t=645 clk=1 reset=0 in=0 out=0
seq_detect_101_mealy_overlap_tb.v:28: $finish called at 650 (1s)
t=650 clk=0 reset=0 in=1 out=1
*/ 
