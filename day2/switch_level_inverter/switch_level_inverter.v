module switch_level_inverter(input in, output out);
supply0 a;
supply1 b;
nmos (out,a,in);
pmos (out,b,in);
endmodule
