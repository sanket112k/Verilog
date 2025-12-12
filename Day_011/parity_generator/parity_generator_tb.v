module parity_generator_tb;
parameter N=4;
reg [N-1:0]in;
wire even_pbit,odd_pbit;
integer i;
parity_generator #(.N(N)) a(in,even_pbit,odd_pbit);
initial begin
    for(i=0;i<2**N;i=i+1) begin
        in=i; #10
        $display("in=%b even parity bit=%b odd parity bit=%b",in,even_pbit,odd_pbit);
    end
	$finish;
end
endmodule

/*
* OUTPUT
in=0000 even parity bit=0 odd parity bit=1
in=0001 even parity bit=1 odd parity bit=0
in=0010 even parity bit=1 odd parity bit=0
in=0011 even parity bit=0 odd parity bit=1
in=0100 even parity bit=1 odd parity bit=0
in=0101 even parity bit=0 odd parity bit=1
in=0110 even parity bit=0 odd parity bit=1
in=0111 even parity bit=1 odd parity bit=0
in=1000 even parity bit=1 odd parity bit=0
in=1001 even parity bit=0 odd parity bit=1
in=1010 even parity bit=0 odd parity bit=1
in=1011 even parity bit=1 odd parity bit=0
in=1100 even parity bit=0 odd parity bit=1
in=1101 even parity bit=1 odd parity bit=0
in=1110 even parity bit=1 odd parity bit=0
in=1111 even parity bit=0 odd parity bit=1
parity_generator_tb.v:12: $finish called at 160 (1s)
* 
*/
