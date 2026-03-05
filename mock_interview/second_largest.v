module second_largest;
reg [7:0] arr [0:7];
reg [7:0] max1, max2;
integer i;
initial begin
    arr[0] = 2;
    arr[1] = 10;
    arr[2] = 3;
    arr[3] = 25;
    arr[4] = 2;
    arr[5] = 22;
    arr[6] = 12;
    arr[7] = 6;
    max1 = 0;
    max2 = 0;
    for (i=0; i<8; i=i+1) begin
        if(arr [i] > max1) begin
            max2 = max1;
            max1 = arr [i];
        end else if (arr [i] > max2 && arr[i] != max1)
            max2 = arr [i];
    end
    $display("The second largest number in the array is %0d", max2);
end
endmodule

/*
Output:
The second largest number in the array is 22
*/
