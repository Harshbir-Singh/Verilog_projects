module moore(Y,x,clk);
  input x,clk;
  output Y;
  wire A,B,in1,in2;
  


  FlipFlop D1(A,in1,clk);
  FlipFlop D2(B,in2,clk);
  assign in1 = x&B;
  assign in2 = ~x|A;
  assign Y = A&B;

endmodule

module FlipFlop(out,in,clk);

  input in,clk;
  output reg out;

  always@(posedge clk)
    begin 
      out <= in;
    end

endmodule
