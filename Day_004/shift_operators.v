module shift_operators;
reg signed [7:0]data;
reg [3:0]shift;

wire [7:0]logical_left_shift;
wire [7:0]logical_right_shift;
wire [7:0]arithmetic_left_shift;
wire [7:0]arithmetic_right_shift;

assign logical_left_shift     = data << shift;
assign logical_right_shift    = data >> shift;
assign arithmetic_left_shift  = data <<< shift; 
assign arithmetic_right_shift = data >>> shift;

initial begin
	data=8'b00001111;shift=2;#5  
	data=8'b11110000;shift=2;#5
    data=8'b1111zzzz;shift=2;#5 
	data=8'b1111xxxx;shift=2;#5
	data=8'bzzzz1111;shift=2;#5 
	data=8'bxxxx1111;shift=2;#5
    $finish;
end
initial begin
	$monitor("%b<<%0d = %b | %b>>%0d = %b | %b<<<%0d = %b | %b>>>%0d = %b",data, shift,logical_left_shift, data, shift,logical_right_shift, data, shift,arithmetic_left_shift, data, shift, arithmetic_right_shift);
end
endmodule

/*
* OUTPUT
00001111<<2 = 00111100 | 00001111>>2 = 00000011 | 00001111<<<2 = 00111100 | 00001111>>>2 = 00000011
11110000<<2 = 11000000 | 11110000>>2 = 00111100 | 11110000<<<2 = 11000000 | 11110000>>>2 = 11111100
1111zzzz<<2 = 11zzzz00 | 1111zzzz>>2 = 001111zz | 1111zzzz<<<2 = 11zzzz00 | 1111zzzz>>>2 = 111111zz
1111xxxx<<2 = 11xxxx00 | 1111xxxx>>2 = 001111xx | 1111xxxx<<<2 = 11xxxx00 | 1111xxxx>>>2 = 111111xx
zzzz1111<<2 = zz111100 | zzzz1111>>2 = 00zzzz11 | zzzz1111<<<2 = zz111100 | zzzz1111>>>2 = zzzzzz11
xxxx1111<<2 = xx111100 | xxxx1111>>2 = 00xxxx11 | xxxx1111<<<2 = xx111100 | xxxx1111>>>2 = xxxxxx11
shift_operators.v:22: $finish called at 30 (1s)
*  
*/ 
