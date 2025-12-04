module replication_operator;
	reg [63:0]y;
    initial begin
        assign y={64{1'b1}};
        $display("64-bit representation of -1 = %b",y);
    end
endmodule

/*
* OUTPUT
* 64-bit representation of -1 = 1111111111111111111111111111111111111111111111111111111111111111
*/
