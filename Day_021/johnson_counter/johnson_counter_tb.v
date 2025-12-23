module johnson_counter_tb;
parameter N=8;
reg clk;
reg rstn;
wire [N-1:0]pout;

johnson_counter #(.N(N)) dut(clk, rstn, pout);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rstn = 1;
    repeat(10) begin
        @(posedge clk);
        rstn = 1;
    end
    repeat(4) begin
        @(negedge clk);
        rstn = 0;
    end
    repeat(20) begin
        @(posedge clk);
        rstn = 1;
    end
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b pout=%b", $time, clk, rstn, pout);
    $dumpfile("johnson_counter.vcd");
    $dumpvars(0,johnson_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1_XZKlYz1Awgz3OYiP-dyRAlMDc0RszC1/view?usp=sharing
* OUTPUT
VCD info: dumpfile johnson_counter.vcd opened for output.
t=0 clk=0 reset=1 pout=00000001
t=5 clk=1 reset=1 pout=00000011
t=10 clk=0 reset=1 pout=00000011
t=15 clk=1 reset=1 pout=00000111
t=20 clk=0 reset=1 pout=00000111
t=25 clk=1 reset=1 pout=00001111
t=30 clk=0 reset=1 pout=00001111
t=35 clk=1 reset=1 pout=00011111
t=40 clk=0 reset=1 pout=00011111
t=45 clk=1 reset=1 pout=00111111
t=50 clk=0 reset=1 pout=00111111
t=55 clk=1 reset=1 pout=01111111
t=60 clk=0 reset=1 pout=01111111
t=65 clk=1 reset=1 pout=11111111
t=70 clk=0 reset=1 pout=11111111
t=75 clk=1 reset=1 pout=11111110
t=80 clk=0 reset=1 pout=11111110
t=85 clk=1 reset=1 pout=11111100
t=90 clk=0 reset=1 pout=11111100
t=95 clk=1 reset=0 pout=00000001
t=100 clk=0 reset=0 pout=00000001
t=105 clk=1 reset=0 pout=00000001
t=110 clk=0 reset=0 pout=00000001
t=115 clk=1 reset=0 pout=00000001
t=120 clk=0 reset=0 pout=00000001
t=125 clk=1 reset=0 pout=00000001
t=130 clk=0 reset=0 pout=00000001
t=135 clk=1 reset=1 pout=00000011
t=140 clk=0 reset=1 pout=00000011
t=145 clk=1 reset=1 pout=00000111
t=150 clk=0 reset=1 pout=00000111
t=155 clk=1 reset=1 pout=00001111
t=160 clk=0 reset=1 pout=00001111
t=165 clk=1 reset=1 pout=00011111
t=170 clk=0 reset=1 pout=00011111
t=175 clk=1 reset=1 pout=00111111
t=180 clk=0 reset=1 pout=00111111
t=185 clk=1 reset=1 pout=01111111
t=190 clk=0 reset=1 pout=01111111
t=195 clk=1 reset=1 pout=11111111
t=200 clk=0 reset=1 pout=11111111
t=205 clk=1 reset=1 pout=11111110
t=210 clk=0 reset=1 pout=11111110
t=215 clk=1 reset=1 pout=11111100
t=220 clk=0 reset=1 pout=11111100
t=225 clk=1 reset=1 pout=11111000
t=230 clk=0 reset=1 pout=11111000
t=235 clk=1 reset=1 pout=11110000
t=240 clk=0 reset=1 pout=11110000
t=245 clk=1 reset=1 pout=11100000
t=250 clk=0 reset=1 pout=11100000
t=255 clk=1 reset=1 pout=11000000
t=260 clk=0 reset=1 pout=11000000
t=265 clk=1 reset=1 pout=10000000
t=270 clk=0 reset=1 pout=10000000
t=275 clk=1 reset=1 pout=00000000
t=280 clk=0 reset=1 pout=00000000
t=285 clk=1 reset=1 pout=00000001
t=290 clk=0 reset=1 pout=00000001
t=295 clk=1 reset=1 pout=00000011
t=300 clk=0 reset=1 pout=00000011
t=305 clk=1 reset=1 pout=00000111
t=310 clk=0 reset=1 pout=00000111
t=315 clk=1 reset=1 pout=00001111
t=320 clk=0 reset=1 pout=00001111
t=325 clk=1 reset=1 pout=00011111
t=330 clk=0 reset=1 pout=00011111
johnson_counter_tb.v:19: $finish called at 335 (1s)
t=335 clk=1 reset=1 pout=00111111
*/
