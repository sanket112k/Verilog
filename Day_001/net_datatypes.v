module net_datatypes();
reg a,b;

wire    y0;
wand    y1;
wor     y2;
tri0    y3;
tri1    y4;
triand  y5;
trior   y6;
supply0 y7;
supply1 y8;

assign y0=a;	//wire
assign y1=a;	//wand
assign y1=b;	//wand 
assign y2=a;	//wor  
assign y2=b;	//wor  
assign y3=a;	//tri0
assign y3=b;	//tri0
assign y4=a;	//tri1  
assign y4=b;	//tri1  
assign y5=a;	//triand
assign y5=b;	//triand
assign y6=a;	//trior 
assign y6=b;	//trior 
assign y7=a;	//supply0
assign y7=b;	//supply0
assign y8=a;	//supply1
assign y8=b;	//supply1

initial begin
	a=1'b0;b=1'b0;#5  
	a=1'b0;b=1'b1;#5 
	a=1'b1;b=1'b0;#5 
	a=1'b1;b=1'b1;#5
	a=1'b0;b=1'bx;#5
	a=1'b1;b=1'bx;#5
	a=1'bx;b=1'b0;#5
	a=1'bx;b=1'b1;#5
    a=1'bx;b=1'bx;#5
	a=1'b0;b=1'bz;#5
    a=1'b1;b=1'bz;#5
    a=1'bz;b=1'b0;#5
    a=1'bz;b=1'b1;#5
	a=1'bz;b=1'bz;#5 
	$finish;
end
initial begin
	$monitor("@time=%0t   a=%b b=%b   wire=%b wand=%b wor=%b tri0=%b tri1=%b triand=%b trior=%b supply0=%b supply1=%b",$time,a,b,y0,y1,y2,y3,y4,y5,y6,y7,y8);
end
endmodule

/*
* OUTPUT
@time=0    a=0 b=0   wire=0 wand=0 wor=0 tri0=0 tri1=0 triand=0 trior=0 supply0=0 supply1=1
@time=5    a=0 b=1   wire=0 wand=0 wor=1 tri0=x tri1=x triand=0 trior=1 supply0=0 supply1=1
@time=10   a=1 b=0   wire=1 wand=0 wor=1 tri0=x tri1=x triand=0 trior=1 supply0=0 supply1=1
@time=15   a=1 b=1   wire=1 wand=1 wor=1 tri0=1 tri1=1 triand=1 trior=1 supply0=0 supply1=1

@time=20   a=0 b=x   wire=0 wand=0 wor=x tri0=x tri1=x triand=0 trior=x supply0=0 supply1=1
@time=25   a=1 b=x   wire=1 wand=x wor=1 tri0=x tri1=x triand=x trior=1 supply0=0 supply1=1
@time=30   a=x b=0   wire=x wand=0 wor=x tri0=x tri1=x triand=0 trior=x supply0=0 supply1=1
@time=35   a=x b=1   wire=x wand=x wor=1 tri0=x tri1=x triand=x trior=1 supply0=0 supply1=1
@time=40   a=x b=x   wire=x wand=x wor=x tri0=x tri1=x triand=x trior=x supply0=0 supply1=1

@time=45   a=0 b=z   wire=0 wand=0 wor=0 tri0=0 tri1=0 triand=0 trior=0 supply0=0 supply1=1
@time=50   a=1 b=z   wire=1 wand=1 wor=1 tri0=1 tri1=1 triand=1 trior=1 supply0=0 supply1=1
@time=55   a=z b=0   wire=z wand=0 wor=0 tri0=0 tri1=0 triand=0 trior=0 supply0=0 supply1=1
@time=60   a=z b=1   wire=z wand=1 wor=1 tri0=1 tri1=1 triand=1 trior=1 supply0=0 supply1=1
@time=65   a=z b=z   wire=z wand=z wor=z tri0=0 tri1=1 triand=z trior=z supply0=0 supply1=1
net_datatypes.v:47: $finish called at 70 (1s)

*/ 
