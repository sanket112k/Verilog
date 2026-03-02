module sort_array;
  reg [7:0] arr [0:7];
  integer i, j;
  reg [7:0] temp;

  initial begin
    // Initialize array
    arr[0]=25; arr[1]=10; arr[2]=45; arr[3]=3;
    arr[4]=18; arr[5]=50; arr[6]=1; arr[7]=30;

    // Bubble Sort
    for(i=0; i<8; i=i+1) begin
      for(j=0; j<7-i; j=j+1) begin
        if(arr[j] > arr[j+1]) begin
          temp       = arr[j];
          arr[j]     = arr[j+1];
          arr[j+1]   = temp;
        end
      end
    end

    // Display sorted array
    for(i=0; i<8; i=i+1)
      $display("arr[%0d] = %0d", i, arr[i]);
  end

endmodule
