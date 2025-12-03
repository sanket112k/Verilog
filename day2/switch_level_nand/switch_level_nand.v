module switch_level_nand(input in1,in2, output out);
supply0 gnd;
supply1 vdd;
wire x;
nmos (out,x,in1);
nmos (x,gnd,in2);
pmos (out,vdd,in1);
pmos (out,vdd,in2);
endmodule
