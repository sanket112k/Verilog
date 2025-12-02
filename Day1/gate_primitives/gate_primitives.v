module gate_primitives(input a,b, output y1,y2,y3,y4,y5,y6,y7,y8);
and g1(y1,a,b);
or g2(y2,a,b);
not g3(y3,b);
nand g4(y4,a,b);
nor g5(y5,a,b);
xor g6(y6,a,b);
xnor g7(y7,a,b);
buf g8(y8,b);
endmodule
