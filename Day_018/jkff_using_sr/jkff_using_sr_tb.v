`timescale 1ns/1ps
module jkff_using_sr_tb;
reg clk, reset, j, k;
wire q;
jkff_using_sr dut(clk, reset, j, k, q);
initial begin
    clk = 0; 
    forever #5 clk = ~clk;
end
initial begin
    {j,k} = 2'b01;
    repeat (40) begin
        @(negedge clk);
        #2;
        {j,k} = $urandom_range(2'b00,2'b11);
        #5;
    end
    $finish;
end
initial begin
    reset = 1; #10;
    reset = 0; #28;
    reset = 1; #10;
    reset = 0;
end
initial begin
    $monitor($time," clk=%b reset=%b j=%b k=%b q=%b", clk, reset, j, k, q);
    $dumpfile("jkff_using_sr.vcd");
    $dumpvars(0,jkff_using_sr_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1zbWL0yqxdUz_8LJueZUgJ8q9dGGrgkru/view?usp=sharing
*
* OUTPUT
VCD info: dumpfile jkff_using_sr.vcd opened for output.
                   0 clk=0 reset=1 j=0 k=1 q=x
                   5 clk=1 reset=1 j=0 k=1 q=0
                  10 clk=0 reset=0 j=0 k=1 q=0
                  12 clk=0 reset=0 j=1 k=0 q=0
                  15 clk=1 reset=0 j=1 k=0 q=1
                  20 clk=0 reset=0 j=1 k=0 q=1
                  22 clk=0 reset=0 j=0 k=1 q=1
                  25 clk=1 reset=0 j=0 k=1 q=0
                  30 clk=0 reset=0 j=0 k=1 q=0
                  32 clk=0 reset=0 j=0 k=0 q=0
                  35 clk=1 reset=0 j=0 k=0 q=0
                  38 clk=1 reset=1 j=0 k=0 q=0
                  40 clk=0 reset=1 j=0 k=0 q=0
                  45 clk=1 reset=1 j=0 k=0 q=0
                  48 clk=1 reset=0 j=0 k=0 q=0
                  50 clk=0 reset=0 j=0 k=0 q=0
                  52 clk=0 reset=0 j=1 k=0 q=0
                  55 clk=1 reset=0 j=1 k=0 q=1
                  60 clk=0 reset=0 j=1 k=0 q=1
                  62 clk=0 reset=0 j=1 k=1 q=1
                  65 clk=1 reset=0 j=1 k=1 q=0
                  70 clk=0 reset=0 j=1 k=1 q=0
                  72 clk=0 reset=0 j=0 k=0 q=0
                  75 clk=1 reset=0 j=0 k=0 q=0
                  80 clk=0 reset=0 j=0 k=0 q=0
                  85 clk=1 reset=0 j=0 k=0 q=0
                  90 clk=0 reset=0 j=0 k=0 q=0
                  92 clk=0 reset=0 j=1 k=0 q=0
                  95 clk=1 reset=0 j=1 k=0 q=1
                 100 clk=0 reset=0 j=1 k=0 q=1
                 105 clk=1 reset=0 j=1 k=0 q=1
                 110 clk=0 reset=0 j=1 k=0 q=1
                 115 clk=1 reset=0 j=1 k=0 q=1
                 120 clk=0 reset=0 j=1 k=0 q=1
                 125 clk=1 reset=0 j=1 k=0 q=1
                 130 clk=0 reset=0 j=1 k=0 q=1
                 132 clk=0 reset=0 j=1 k=1 q=1
                 135 clk=1 reset=0 j=1 k=1 q=0
                 140 clk=0 reset=0 j=1 k=1 q=0
                 145 clk=1 reset=0 j=1 k=1 q=1
                 150 clk=0 reset=0 j=1 k=1 q=1
                 155 clk=1 reset=0 j=1 k=1 q=0
                 160 clk=0 reset=0 j=1 k=1 q=0
                 162 clk=0 reset=0 j=0 k=1 q=0
                 165 clk=1 reset=0 j=0 k=1 q=0
                 170 clk=0 reset=0 j=0 k=1 q=0
                 175 clk=1 reset=0 j=0 k=1 q=0
                 180 clk=0 reset=0 j=0 k=1 q=0
                 185 clk=1 reset=0 j=0 k=1 q=0
                 190 clk=0 reset=0 j=0 k=1 q=0
                 192 clk=0 reset=0 j=1 k=1 q=0
                 195 clk=1 reset=0 j=1 k=1 q=1
                 200 clk=0 reset=0 j=1 k=1 q=1
                 202 clk=0 reset=0 j=0 k=0 q=1
                 205 clk=1 reset=0 j=0 k=0 q=1
                 210 clk=0 reset=0 j=0 k=0 q=1
                 215 clk=1 reset=0 j=0 k=0 q=1
                 220 clk=0 reset=0 j=0 k=0 q=1
                 222 clk=0 reset=0 j=1 k=1 q=1
                 225 clk=1 reset=0 j=1 k=1 q=0
                 230 clk=0 reset=0 j=1 k=1 q=0
                 235 clk=1 reset=0 j=1 k=1 q=1
                 240 clk=0 reset=0 j=1 k=1 q=1
                 242 clk=0 reset=0 j=0 k=1 q=1
                 245 clk=1 reset=0 j=0 k=1 q=0
                 250 clk=0 reset=0 j=0 k=1 q=0
                 255 clk=1 reset=0 j=0 k=1 q=0
                 260 clk=0 reset=0 j=0 k=1 q=0
                 265 clk=1 reset=0 j=0 k=1 q=0
                 270 clk=0 reset=0 j=0 k=1 q=0
                 272 clk=0 reset=0 j=1 k=0 q=0
                 275 clk=1 reset=0 j=1 k=0 q=1
                 280 clk=0 reset=0 j=1 k=0 q=1
                 282 clk=0 reset=0 j=0 k=1 q=1
                 285 clk=1 reset=0 j=0 k=1 q=0
                 290 clk=0 reset=0 j=0 k=1 q=0
                 292 clk=0 reset=0 j=0 k=0 q=0
                 295 clk=1 reset=0 j=0 k=0 q=0
                 300 clk=0 reset=0 j=0 k=0 q=0
                 305 clk=1 reset=0 j=0 k=0 q=0
                 310 clk=0 reset=0 j=0 k=0 q=0
                 315 clk=1 reset=0 j=0 k=0 q=0
                 320 clk=0 reset=0 j=0 k=0 q=0
                 322 clk=0 reset=0 j=1 k=0 q=0
                 325 clk=1 reset=0 j=1 k=0 q=1
                 330 clk=0 reset=0 j=1 k=0 q=1
                 332 clk=0 reset=0 j=0 k=1 q=1
                 335 clk=1 reset=0 j=0 k=1 q=0
                 340 clk=0 reset=0 j=0 k=1 q=0
                 342 clk=0 reset=0 j=1 k=0 q=0
                 345 clk=1 reset=0 j=1 k=0 q=1
                 350 clk=0 reset=0 j=1 k=0 q=1
                 352 clk=0 reset=0 j=1 k=1 q=1
                 355 clk=1 reset=0 j=1 k=1 q=0
                 360 clk=0 reset=0 j=1 k=1 q=0
                 362 clk=0 reset=0 j=0 k=1 q=0
                 365 clk=1 reset=0 j=0 k=1 q=0
                 370 clk=0 reset=0 j=0 k=1 q=0
                 375 clk=1 reset=0 j=0 k=1 q=0
                 380 clk=0 reset=0 j=0 k=1 q=0
                 382 clk=0 reset=0 j=0 k=0 q=0
                 385 clk=1 reset=0 j=0 k=0 q=0
                 390 clk=0 reset=0 j=0 k=0 q=0
                 395 clk=1 reset=0 j=0 k=0 q=0
                 400 clk=0 reset=0 j=0 k=0 q=0
                 405 clk=1 reset=0 j=0 k=0 q=0
jkff_using_sr_tb.v:18: $finish called at 407000 (1ps)
* 
*/
