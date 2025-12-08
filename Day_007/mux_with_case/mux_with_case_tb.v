module mux_with_case_tb;
reg in0,in1,s;
output out;
mux_with_case dut(in0,in1,s,out);
initial begin
    s=0;in0=0;in1=0;#5
    s=0;in0=0;in1=1;#5
    s=0;in0=1;in1=0;#5
    s=0;in0=1;in1=1;#5
    s=1;in0=0;in1=0;#5
    s=1;in0=0;in1=1;#5
    s=1;in0=1;in1=0;#5
    s=1;in0=1;in1=1;#5
    $finish;
end
initial begin
    $monitor("select=%b input0=%b input1=%b output=%b",s,in0,in1,out);
end
endmodule

/*
* OUTPUT
select=0 input0=0 input1=0 output=0
select=0 input0=0 input1=1 output=0
select=0 input0=1 input1=0 output=1
select=0 input0=1 input1=1 output=1
select=1 input0=0 input1=0 output=0
select=1 input0=0 input1=1 output=1
select=1 input0=1 input1=0 output=0
select=1 input0=1 input1=1 output=1
mux_with_case_tb.v:14: $finish called at 40 (1s)
* 
*/
