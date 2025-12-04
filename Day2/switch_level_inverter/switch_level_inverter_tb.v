module switch_level_inverter_tb;
reg in;
wire out;
switch_level_inverter d(in,out);
initial begin
	$monitor("@time=%0t in=%b out=%b",$time,in,out);
	in=1'b0;
	#5 in=1'b1;
	#5 in=1'bx;
	#5 in=1'bz;
	#5 $finish;
end
endmodule

/*
@time=0  in=0 out=1
@time=5  in=1 out=0
@time=10 in=x out=x
@time=15 in=z out=x
switch_level_inverter_tb.v:11: $finish called at 20 (1s)
*/ 
