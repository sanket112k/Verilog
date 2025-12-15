module swap_using_blocking;
reg a,b,c,d,temp;
initial begin
    a = 1'b0;
    b = 1'b1;
    c = 1'b0;
    d = 1'b1;
    #5
    $display("before swap a=%b b=%b c=%b d=%b temp=%b",a,b,c,d,temp);
    a=b;
    b=a;    //a=b, b=new a, so, a=b=a
    temp=c;
    c=d;
    d=temp;
    #5
    $display("after swap a=%b b=%b c=%b d=%b temp=%b",a,b,c,d,temp);
end
endmodule

/*
* OUTPUT
before swap a=0 b=1 c=0 d=1 temp=x
after  swap a=1 b=1 c=1 d=0 temp=0
* 
*/
