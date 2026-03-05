module clock_f6(
  input clkin, reset,
  output clkout;
);
  reg [1:0] count;
  always @(posedge clkin) begin
    if (reset) begin
      count <= 0;
      clkout <= 0;
    end else if (count == 2) begin
      count <= 0;
      clk <= ~clkout;
    end
      else count = count + 1;
  end
endmodule
