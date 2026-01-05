module uart_receiver(
    input clk,
    input in,
    //input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done     // done indicates that the data is valid and also it is valid
);
/***********************************************************************************/
    reg [2:0] state, next;
    reg [7:0] out_reg;
    reg odd_reset;
    reg odd, d_valid;
    integer i;
    parameter [2:0] IDLE    = 3'd0,
                    START   = 3'd1,
                    RECEIVE = 3'd2,
                    CHECK   = 3'd3,     //parity check
                    WAIT    = 3'd4,
                    STOP    = 3'd5;
/************************************************************************************/
    always @(*) begin 		// State transition logic
        case(state)
            IDLE    : next = in ? IDLE : START;
            START   : next = RECEIVE;
            RECEIVE : next = (i==8) ? CHECK : RECEIVE;      // 0 to 7 = data;
            CHECK   : next = in ? STOP : WAIT;
            WAIT    : next = in ? IDLE : WAIT;              // wait till stop bit is recieved
            STOP    : next = in ? IDLE : START;
            default : next = IDLE;
        endcase
    end

    always @(posedge clk) begin	
        if (reset) state <= IDLE;
        else state <= next;                 // State transition
    end
    
/*************************************************************************************/
	always @(posedge clk) begin
        if (reset) begin i <= 0; out_reg <=0; end
		else begin
			case(next)
                START   : begin out_reg[i] <=  0;   i <= 0; end
                RECEIVE : begin out_reg[i] <= in;   i <= i + 1; end      // count data length and assign to out_reg
			endcase
		end
	end

    parity dut(clk, (reset || odd_reset), in, odd);
    
    always @(posedge clk) begin		        // d_valid is TRUE when parity check passes
        if (reset) d_valid <= 0;
        else d_valid <= odd;
    end

    always @(posedge clk) begin             // reset parity check
		case(next)
			IDLE : odd_reset <= 1;	
			STOP : odd_reset <= 1;
			default : odd_reset <= 0;
		endcase
    end

    assign out_byte = (done) ? out_reg : 8'b0;

    assign done = ((state == STOP) && d_valid);
    
endmodule

/**************************************************************************/
module parity (
    input clk,
    input reset,
    input in,
    output reg odd);

    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;

endmodule

/*
module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); 
	
    // Use FSM from Fsm_serial
    localparam [2:0] IDLE 	 = 3'b000,
					 START 	 = 3'b001,
					 RECEIVE = 3'b010,
					 WAIT	 = 3'b011,
					 STOP    = 3'b100,
					 CHECK   = 3'b101;

	reg [2:0] state, next;
	reg [3:0] i;
	reg [7:0] out;
	reg odd_reset;
	reg odd_reg;
	wire odd;	
	

	always @(*) begin
		case(state)
			IDLE  	: next = (in) ? IDLE : START;
			START 	: next = RECEIVE;
			RECEIVE : next = (i == 8) ? CHECK : RECEIVE;
			CHECK 	: next = (in) ? STOP : WAIT;
			WAIT 	: next = (in) ? IDLE : WAIT;
			STOP 	: next = (in) ? IDLE : START;
		endcase
	end

	always @(posedge clk) begin
		if(reset) state <= IDLE;
		else state <= next;
	end

	always @(posedge clk) begin
		if (reset) begin
			i <= 0;
		end
		else begin
			case(next) 
				RECEIVE : begin
					i = i + 4'h1;
				end
				STOP : begin
					i <= 0;
				end
				default : begin
					i <= 0;
				end
			endcase
		end
	end

    // New: Datapath to latch input bits.
    always @(posedge clk) begin
    	if (reset) out <= 0;
    	else if (next == RECEIVE)
    		out[i] <= in;
    end

    // New: Add parity checking.
    parity u_parity(
        .clk(clk),
        .reset(reset | odd_reset),
        .in(in),
        .odd(odd));  

    always @(posedge clk) begin
    	if(reset) odd_reg <= 0;
    	else odd_reg <= odd; 
    end

    always @(posedge clk) begin
		case(next)
			IDLE : odd_reset <= 1;	
			STOP : odd_reset <= 1;
			default : odd_reset <= 0;
		endcase
    end

    assign done = ((state == STOP) && odd_reg);
    assign out_byte = (done) ? out : 8'b0;

endmodule
*/


module uart_rx (
    input clk,          // FPGA clock
    input rx_in,        // Serial input
    output [7:0] data,  // Received data
    output data_valid   // Data ready to read
);

parameter CLK_FREQ = 50_000_000;
parameter BAUD_RATE = 115200;
localparam BIT_TIME = CLK_FREQ / BAUD_RATE;
localparam HALF_BIT = BIT_TIME / 2;
reg [3:0] state = 0;
reg [15:0] counter = 0;
reg [7:0] shift_reg = 0;
always @(posedge clk) begin
    case (state)
        0: begin  // Wait for start bit (falling edge)
            if (!rx_in) begin
                counter <= 0;
                state <= 1;
            end
        end
        1: begin  // Sample mid-start bit
            if (counter == HALF_BIT - 1) begin
                if (!rx_in) begin  // Confirm start bit
                    counter <= 0;
                    state <= 2;
                end else state <= 0;  // False start
            end else counter <= counter + 1;
        end
        2 to 9: begin  // Sample data bits
            if (counter == BIT_TIME - 1) begin
                shift_reg[state - 2] <= rx_in;  // Store bit
                counter <= 0;
                state <= state + 1;
            end else counter <= counter + 1;
        end
        10: begin  // Stop bit
            if (counter == BIT_TIME - 1) begin
                counter <= 0;
                state <= 0;
            end else counter <= counter + 1;
        end
    endcase
end
assign data = shift_reg;
assign data_valid = (state == 10 && counter == BIT_TIME - 1);
endmodule
