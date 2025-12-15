module swap_using_blocking;
reg a,b;
initial begin
    a = 1'b0;
    b = 1'b1;
    #5
    $display("before swap a=%b b=%b",a,b);
    a<=b;
    b<=a;
    #5
    $display("after swap a=%b b=%b",a,b);
end
endmodule

/*
* OUTPUT
before swap a=0 b=1
after  swap a=1 b=0
* 
*/
