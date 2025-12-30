module  function_example(
input [7:0]in,
output pbit
);

function even_parity(input [7:0]in);
begin
    even_parity = ^in;
end
endfunction

assign pbit = even_parity(in);

endmodule
