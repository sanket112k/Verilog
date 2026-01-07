module uart_receiver(
    input clk,
    input rx_in,
    output [7:0] data,
    output rx_done     // Indicates that the data is recieved and also it is valid
);

parameter CLK_FREQ = 50_000_000;
parameter BAUD_RATE = 9600;
parameter BIT_TIME = CLK_FREQ / BAUD_RATE;

reg [2:0] state = 0, next;
reg [7:0] out_reg;
reg odd_reset;
wire odd;
reg [3:0] i = 0;
reg [15:0] count = 0;
parameter [2:0] IDLE = 3'd0,
                START= 3'd1,
                DATA = 3'd2,
                CHECK= 3'd3,     //parity check
                WAIT = 3'd4,
                STOP = 3'd5;

/************************************************************************************/
always @(*) begin 		// State transition logic
    case(state)
        IDLE    : next = rx_in ? IDLE : START;
        START   : next = DATA;
        DATA    : next = (i==7) ? CHECK : DATA;      // 0 to 7 = data; and 8th is parity
        CHECK   : next = rx_in ? STOP : WAIT;
        WAIT    : next = rx_in ? IDLE : WAIT;           // wait till stop bit is recieved
        STOP    : next = rx_in ? IDLE : START;
        default : next = IDLE;
    endcase
end

/************************************************************************************/

always @(posedge clk) begin
    case (state)
        IDLE: begin
            state <= next;
            count <= 0;
        end
        
        START: begin
            if (count == (BIT_TIME/2) - 1) begin    //Half bit time
                state <= next;
                count <= 0;
            end
            else count <= count + 1;
            i <= 0;
        end

        DATA: begin
            if (count == BIT_TIME -1) begin         //Full bit time
                state <= next;
                out_reg[i] <= rx_in;                //Store rx_in in reg for every iteration
                i <= i + 1;
                count <= 0;
            end
            else count <= count + 1;
        end

        default: begin
            if (count == BIT_TIME -1) begin
                state <= next;
                count <= 0;
            end
            else count <= count + 1;
        end
    endcase
end

/**************************************************************************/

parity dut(clk, odd_reset, rx_in, odd);

always @(posedge clk) begin             // reset parity check
	case(next)
		IDLE : odd_reset <= 1;	
		STOP : odd_reset <= 1;
		default : odd_reset <= 0;
	endcase
end

assign rx_done = ((state == STOP) && odd);     //process complete indicator
assign data = (rx_done) ? out_reg : 8'b0;          //output

endmodule




module parity (
    input clk,
    input odd_reset,
    input rx_in,
    output reg odd
);
always @(posedge clk) begin
    if (odd_reset) odd <= 0;
    else if (rx_in) odd <= ~odd;
end
endmodule

