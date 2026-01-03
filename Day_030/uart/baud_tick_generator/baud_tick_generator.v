/*
Assuming FPGA clk = 50 MHz = 50_000_000 Hz;
Selecting Baud rate = 9600 bit/s
*/

module baud_tick_generator(
    input clk, enable,
    output tick
);

parameter CLK_FREQ = 50_000_000;
parameter BAUD = 9600;
parameter OVER_SAMPLING = 1;    //No. of samples per bit. More samples gives more accurate data

//ACC => Accumulator
parameter ACC_WIDTH = $clog2(CLK_FREQ/BAUD) + 8;    //Extra 8-bits for more precise result
reg [ACC_WIDTH : 0] acc = 0;      //Actually it must be [ACC_WIDTH - 1 : 0], one extra carry bit is the output


//parameter INC = (BAUD<<ACC_WIDTH)/CLK_FREQ;
parameter SHIFT_LIMITER = $clog2(BAUD*OVER_SAMPLING >> (31-ACC_WIDTH));     // this makes sure INC calculation doesn't overflow
parameter INC = ((BAUD*OVER_SAMPLING << (ACC_WIDTH-SHIFT_LIMITER)) + (CLK_FREQ >> (SHIFT_LIMITER+1))) / (CLK_FREQ>>SHIFT_LIMITER);




always @(posedge clk) begin
    if (enable) acc <= acc[ACC_WIDTH-1 : 0] + INC[ACC_WIDTH : 0];
    else acc <= INC[ACC_WIDTH : 0];
end

assign tick = acc[ACC_WIDTH];
endmodule
