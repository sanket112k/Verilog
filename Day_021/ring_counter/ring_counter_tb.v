module ring_counter_tb;
parameter N=8;
reg clk;
reg rstn;
wire [N-1:0]pout;

ring_counter #(.N(N)) dut(clk, rstn, pout);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rstn = 1;
    repeat(10) @(posedge clk);
    rstn = 0;
    repeat(4) @(posedge clk);
    rstn = 1;
    repeat(10) @(posedge clk);
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b pout=%b", $time, clk, rstn, pout);
    $dumpfile("ring_counter.vcd");
    $dumpvars(0,ring_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1tb4oZF1b1e5H4ICVN4IexnHeEeWiXxU3/view?usp=sharing
* OUTPUT
VCD info: dumpfile ring_counter.vcd opened for output.
t=0 clk=0 reset=1 pout=00000001
t=5 clk=1 reset=1 pout=00000010
t=10 clk=0 reset=1 pout=00000010
t=15 clk=1 reset=1 pout=00000100
t=20 clk=0 reset=1 pout=00000100
t=25 clk=1 reset=1 pout=00001000
t=30 clk=0 reset=1 pout=00001000
t=35 clk=1 reset=1 pout=00010000
t=40 clk=0 reset=1 pout=00010000
t=45 clk=1 reset=1 pout=00100000
t=50 clk=0 reset=1 pout=00100000
t=55 clk=1 reset=1 pout=01000000
t=60 clk=0 reset=1 pout=01000000
t=65 clk=1 reset=1 pout=10000000
t=70 clk=0 reset=1 pout=10000000
t=75 clk=1 reset=1 pout=00000001
t=80 clk=0 reset=1 pout=00000001
t=85 clk=1 reset=1 pout=00000010
t=90 clk=0 reset=1 pout=00000010
t=95 clk=1 reset=0 pout=00000001
t=100 clk=0 reset=0 pout=00000001
t=105 clk=1 reset=0 pout=00000001
t=110 clk=0 reset=0 pout=00000001
t=115 clk=1 reset=0 pout=00000001
t=120 clk=0 reset=0 pout=00000001
t=125 clk=1 reset=0 pout=00000001
t=130 clk=0 reset=0 pout=00000001
t=135 clk=1 reset=1 pout=00000010
t=140 clk=0 reset=1 pout=00000010
t=145 clk=1 reset=1 pout=00000100
t=150 clk=0 reset=1 pout=00000100
t=155 clk=1 reset=1 pout=00001000
t=160 clk=0 reset=1 pout=00001000
t=165 clk=1 reset=1 pout=00010000
t=170 clk=0 reset=1 pout=00010000
t=175 clk=1 reset=1 pout=00100000
t=180 clk=0 reset=1 pout=00100000
t=185 clk=1 reset=1 pout=01000000
t=190 clk=0 reset=1 pout=01000000
t=195 clk=1 reset=1 pout=10000000
t=200 clk=0 reset=1 pout=10000000
t=205 clk=1 reset=1 pout=00000001
t=210 clk=0 reset=1 pout=00000001
t=215 clk=1 reset=1 pout=00000010
t=220 clk=0 reset=1 pout=00000010
t=225 clk=1 reset=1 pout=00000100
t=230 clk=0 reset=1 pout=00000100
ring_counter_tb.v:19: $finish called at 235 (1s)
t=235 clk=1 reset=1 pout=00001000
*/
