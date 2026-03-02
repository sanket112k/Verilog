module second_largest;

  reg [7:0] arr [0:7];
  reg [7:0] max1, max2;
  integer i;

  initial begin
    arr[0]=25; arr[1]=10; arr[2]=45; arr[3]=3;
    arr[4]=18; arr[5]=50; arr[6]=1; arr[7]=30;

    // Initialize
    max1 = 0;
    max2 = 0;

    for(i=0; i<8; i=i+1) begin
      if(arr[i] > max1) begin
        max2 = max1;
        max1 = arr[i];
      end
      else if(arr[i] > max2 && arr[i] != max1) begin
        max2 = arr[i];
      end
    end

    $display("Largest = %0d", max1);
    $display("Second Largest = %0d", max2);
  end

endmodule
