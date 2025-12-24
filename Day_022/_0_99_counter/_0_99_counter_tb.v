module _0_99_counter_tb;
reg clk;
reg reset;
wire [7:0]count;

_0_99_counter dut(clk, reset, count);

always #5 clk = ~clk;

initial begin
    clk=0;
    reset = 0;
    repeat(10) @(posedge clk);
    reset = 1;
    repeat(4) @(posedge clk);
    reset = 0;
    repeat(120) @(posedge clk);
    $finish;
end
initial begin
    $monitor("t=%0t clk=%b reset=%b count=%b", $time, clk, reset, count);
    $dumpfile("_0_99_counter.vcd");
    $dumpvars(0,_0_99_counter_tb);
end
endmodule

/*
* OUTPUT WAVEFORM LINK
* https://drive.google.com/file/d/1iucmidr4Xy_xHjBpP_BZZUx5Rqp69SGP/view?usp=sharing
* OUTPUT
VCD info: dumpfile _0_99_counter.vcd opened for output.
t=0 clk=0 reset=0 count=00000000
t=5 clk=1 reset=0 count=00000001
t=10 clk=0 reset=0 count=00000001
t=15 clk=1 reset=0 count=00000010
t=20 clk=0 reset=0 count=00000010
t=25 clk=1 reset=0 count=00000011
t=30 clk=0 reset=0 count=00000011
t=35 clk=1 reset=0 count=00000100
t=40 clk=0 reset=0 count=00000100
t=45 clk=1 reset=0 count=00000101
t=50 clk=0 reset=0 count=00000101
t=55 clk=1 reset=0 count=00000110
t=60 clk=0 reset=0 count=00000110
t=65 clk=1 reset=0 count=00000111
t=70 clk=0 reset=0 count=00000111
t=75 clk=1 reset=0 count=00001000
t=80 clk=0 reset=0 count=00001000
t=85 clk=1 reset=0 count=00001001
t=90 clk=0 reset=0 count=00001001
t=95 clk=1 reset=1 count=00010000
t=100 clk=0 reset=1 count=00010000
t=105 clk=1 reset=1 count=00000000
t=110 clk=0 reset=1 count=00000000
t=115 clk=1 reset=1 count=00000000
t=120 clk=0 reset=1 count=00000000
t=125 clk=1 reset=1 count=00000000
t=130 clk=0 reset=1 count=00000000
t=135 clk=1 reset=0 count=00000000
t=140 clk=0 reset=0 count=00000000
t=145 clk=1 reset=0 count=00000001
t=150 clk=0 reset=0 count=00000001
t=155 clk=1 reset=0 count=00000010
t=160 clk=0 reset=0 count=00000010
t=165 clk=1 reset=0 count=00000011
t=170 clk=0 reset=0 count=00000011
t=175 clk=1 reset=0 count=00000100
t=180 clk=0 reset=0 count=00000100
t=185 clk=1 reset=0 count=00000101
t=190 clk=0 reset=0 count=00000101
t=195 clk=1 reset=0 count=00000110
t=200 clk=0 reset=0 count=00000110
t=205 clk=1 reset=0 count=00000111
t=210 clk=0 reset=0 count=00000111
t=215 clk=1 reset=0 count=00001000
t=220 clk=0 reset=0 count=00001000
t=225 clk=1 reset=0 count=00001001
t=230 clk=0 reset=0 count=00001001
t=235 clk=1 reset=0 count=00010000
t=240 clk=0 reset=0 count=00010000
t=245 clk=1 reset=0 count=00010001
t=250 clk=0 reset=0 count=00010001
t=255 clk=1 reset=0 count=00010010
t=260 clk=0 reset=0 count=00010010
t=265 clk=1 reset=0 count=00010011
t=270 clk=0 reset=0 count=00010011
t=275 clk=1 reset=0 count=00010100
t=280 clk=0 reset=0 count=00010100
t=285 clk=1 reset=0 count=00010101
t=290 clk=0 reset=0 count=00010101
t=295 clk=1 reset=0 count=00010110
t=300 clk=0 reset=0 count=00010110
t=305 clk=1 reset=0 count=00010111
t=310 clk=0 reset=0 count=00010111
t=315 clk=1 reset=0 count=00011000
t=320 clk=0 reset=0 count=00011000
t=325 clk=1 reset=0 count=00011001
t=330 clk=0 reset=0 count=00011001
t=335 clk=1 reset=0 count=00100000
t=340 clk=0 reset=0 count=00100000
t=345 clk=1 reset=0 count=00100001
t=350 clk=0 reset=0 count=00100001
t=355 clk=1 reset=0 count=00100010
t=360 clk=0 reset=0 count=00100010
t=365 clk=1 reset=0 count=00100011
t=370 clk=0 reset=0 count=00100011
t=375 clk=1 reset=0 count=00100100
t=380 clk=0 reset=0 count=00100100
t=385 clk=1 reset=0 count=00100101
t=390 clk=0 reset=0 count=00100101
t=395 clk=1 reset=0 count=00100110
t=400 clk=0 reset=0 count=00100110
t=405 clk=1 reset=0 count=00100111
t=410 clk=0 reset=0 count=00100111
t=415 clk=1 reset=0 count=00101000
t=420 clk=0 reset=0 count=00101000
t=425 clk=1 reset=0 count=00101001
t=430 clk=0 reset=0 count=00101001
t=435 clk=1 reset=0 count=00110000
t=440 clk=0 reset=0 count=00110000
t=445 clk=1 reset=0 count=00110001
t=450 clk=0 reset=0 count=00110001
t=455 clk=1 reset=0 count=00110010
t=460 clk=0 reset=0 count=00110010
t=465 clk=1 reset=0 count=00110011
t=470 clk=0 reset=0 count=00110011
t=475 clk=1 reset=0 count=00110100
t=480 clk=0 reset=0 count=00110100
t=485 clk=1 reset=0 count=00110101
t=490 clk=0 reset=0 count=00110101
t=495 clk=1 reset=0 count=00110110
t=500 clk=0 reset=0 count=00110110
t=505 clk=1 reset=0 count=00110111
t=510 clk=0 reset=0 count=00110111
t=515 clk=1 reset=0 count=00111000
t=520 clk=0 reset=0 count=00111000
t=525 clk=1 reset=0 count=00111001
t=530 clk=0 reset=0 count=00111001
t=535 clk=1 reset=0 count=01000000
t=540 clk=0 reset=0 count=01000000
t=545 clk=1 reset=0 count=01000001
t=550 clk=0 reset=0 count=01000001
t=555 clk=1 reset=0 count=01000010
t=560 clk=0 reset=0 count=01000010
t=565 clk=1 reset=0 count=01000011
t=570 clk=0 reset=0 count=01000011
t=575 clk=1 reset=0 count=01000100
t=580 clk=0 reset=0 count=01000100
t=585 clk=1 reset=0 count=01000101
t=590 clk=0 reset=0 count=01000101
t=595 clk=1 reset=0 count=01000110
t=600 clk=0 reset=0 count=01000110
t=605 clk=1 reset=0 count=01000111
t=610 clk=0 reset=0 count=01000111
t=615 clk=1 reset=0 count=01001000
t=620 clk=0 reset=0 count=01001000
t=625 clk=1 reset=0 count=01001001
t=630 clk=0 reset=0 count=01001001
t=635 clk=1 reset=0 count=01010000
t=640 clk=0 reset=0 count=01010000
t=645 clk=1 reset=0 count=01010001
t=650 clk=0 reset=0 count=01010001
t=655 clk=1 reset=0 count=01010010
t=660 clk=0 reset=0 count=01010010
t=665 clk=1 reset=0 count=01010011
t=670 clk=0 reset=0 count=01010011
t=675 clk=1 reset=0 count=01010100
t=680 clk=0 reset=0 count=01010100
t=685 clk=1 reset=0 count=01010101
t=690 clk=0 reset=0 count=01010101
t=695 clk=1 reset=0 count=01010110
t=700 clk=0 reset=0 count=01010110
t=705 clk=1 reset=0 count=01010111
t=710 clk=0 reset=0 count=01010111
t=715 clk=1 reset=0 count=01011000
t=720 clk=0 reset=0 count=01011000
t=725 clk=1 reset=0 count=01011001
t=730 clk=0 reset=0 count=01011001
t=735 clk=1 reset=0 count=01100000
t=740 clk=0 reset=0 count=01100000
t=745 clk=1 reset=0 count=01100001
t=750 clk=0 reset=0 count=01100001
t=755 clk=1 reset=0 count=01100010
t=760 clk=0 reset=0 count=01100010
t=765 clk=1 reset=0 count=01100011
t=770 clk=0 reset=0 count=01100011
t=775 clk=1 reset=0 count=01100100
t=780 clk=0 reset=0 count=01100100
t=785 clk=1 reset=0 count=01100101
t=790 clk=0 reset=0 count=01100101
t=795 clk=1 reset=0 count=01100110
t=800 clk=0 reset=0 count=01100110
t=805 clk=1 reset=0 count=01100111
t=810 clk=0 reset=0 count=01100111
t=815 clk=1 reset=0 count=01101000
t=820 clk=0 reset=0 count=01101000
t=825 clk=1 reset=0 count=01101001
t=830 clk=0 reset=0 count=01101001
t=835 clk=1 reset=0 count=01110000
t=840 clk=0 reset=0 count=01110000
t=845 clk=1 reset=0 count=01110001
t=850 clk=0 reset=0 count=01110001
t=855 clk=1 reset=0 count=01110010
t=860 clk=0 reset=0 count=01110010
t=865 clk=1 reset=0 count=01110011
t=870 clk=0 reset=0 count=01110011
t=875 clk=1 reset=0 count=01110100
t=880 clk=0 reset=0 count=01110100
t=885 clk=1 reset=0 count=01110101
t=890 clk=0 reset=0 count=01110101
t=895 clk=1 reset=0 count=01110110
t=900 clk=0 reset=0 count=01110110
t=905 clk=1 reset=0 count=01110111
t=910 clk=0 reset=0 count=01110111
t=915 clk=1 reset=0 count=01111000
t=920 clk=0 reset=0 count=01111000
t=925 clk=1 reset=0 count=01111001
t=930 clk=0 reset=0 count=01111001
t=935 clk=1 reset=0 count=10000000
t=940 clk=0 reset=0 count=10000000
t=945 clk=1 reset=0 count=10000001
t=950 clk=0 reset=0 count=10000001
t=955 clk=1 reset=0 count=10000010
t=960 clk=0 reset=0 count=10000010
t=965 clk=1 reset=0 count=10000011
t=970 clk=0 reset=0 count=10000011
t=975 clk=1 reset=0 count=10000100
t=980 clk=0 reset=0 count=10000100
t=985 clk=1 reset=0 count=10000101
t=990 clk=0 reset=0 count=10000101
t=995 clk=1 reset=0 count=10000110
t=1000 clk=0 reset=0 count=10000110
t=1005 clk=1 reset=0 count=10000111
t=1010 clk=0 reset=0 count=10000111
t=1015 clk=1 reset=0 count=10001000
t=1020 clk=0 reset=0 count=10001000
t=1025 clk=1 reset=0 count=10001001
t=1030 clk=0 reset=0 count=10001001
t=1035 clk=1 reset=0 count=10010000
t=1040 clk=0 reset=0 count=10010000
t=1045 clk=1 reset=0 count=10010001
t=1050 clk=0 reset=0 count=10010001
t=1055 clk=1 reset=0 count=10010010
t=1060 clk=0 reset=0 count=10010010
t=1065 clk=1 reset=0 count=10010011
t=1070 clk=0 reset=0 count=10010011
t=1075 clk=1 reset=0 count=10010100
t=1080 clk=0 reset=0 count=10010100
t=1085 clk=1 reset=0 count=10010101
t=1090 clk=0 reset=0 count=10010101
t=1095 clk=1 reset=0 count=10010110
t=1100 clk=0 reset=0 count=10010110
t=1105 clk=1 reset=0 count=10010111
t=1110 clk=0 reset=0 count=10010111
t=1115 clk=1 reset=0 count=10011000
t=1120 clk=0 reset=0 count=10011000
t=1125 clk=1 reset=0 count=10011001
t=1130 clk=0 reset=0 count=10011001
t=1135 clk=1 reset=0 count=00000000
t=1140 clk=0 reset=0 count=00000000
t=1145 clk=1 reset=0 count=00000001
t=1150 clk=0 reset=0 count=00000001
t=1155 clk=1 reset=0 count=00000010
t=1160 clk=0 reset=0 count=00000010
t=1165 clk=1 reset=0 count=00000011
t=1170 clk=0 reset=0 count=00000011
t=1175 clk=1 reset=0 count=00000100
t=1180 clk=0 reset=0 count=00000100
t=1185 clk=1 reset=0 count=00000101
t=1190 clk=0 reset=0 count=00000101
t=1195 clk=1 reset=0 count=00000110
t=1200 clk=0 reset=0 count=00000110
t=1205 clk=1 reset=0 count=00000111
t=1210 clk=0 reset=0 count=00000111
t=1215 clk=1 reset=0 count=00001000
t=1220 clk=0 reset=0 count=00001000
t=1225 clk=1 reset=0 count=00001001
t=1230 clk=0 reset=0 count=00001001
t=1235 clk=1 reset=0 count=00010000
t=1240 clk=0 reset=0 count=00010000
t=1245 clk=1 reset=0 count=00010001
t=1250 clk=0 reset=0 count=00010001
t=1255 clk=1 reset=0 count=00010010
t=1260 clk=0 reset=0 count=00010010
t=1265 clk=1 reset=0 count=00010011
t=1270 clk=0 reset=0 count=00010011
t=1275 clk=1 reset=0 count=00010100
t=1280 clk=0 reset=0 count=00010100
t=1285 clk=1 reset=0 count=00010101
t=1290 clk=0 reset=0 count=00010101
t=1295 clk=1 reset=0 count=00010110
t=1300 clk=0 reset=0 count=00010110
t=1305 clk=1 reset=0 count=00010111
t=1310 clk=0 reset=0 count=00010111
t=1315 clk=1 reset=0 count=00011000
t=1320 clk=0 reset=0 count=00011000
t=1325 clk=1 reset=0 count=00011001
t=1330 clk=0 reset=0 count=00011001
_0_99_counter_tb.v:18: $finish called at 1335 (1s)
t=1335 clk=1 reset=0 count=00100000
*/ 
