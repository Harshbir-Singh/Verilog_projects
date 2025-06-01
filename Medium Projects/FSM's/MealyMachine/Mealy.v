module mealy(Y,x,clk);
  input x,clk;
  output Y;

  wire in1,in2,A,B,C;

  FlipFlop D1(A,in1,clk);
  FlipFlop D2(B,in2,clk);
  
  assign Y = C|x;
  assign C = A&B;
  assign in1 = x&B;
  assign in2 = ~x|A;


endmodule

module FlipFlop(out,in,clk);
  output reg out;
  input in,clk;

  always@(posedge clk)
    begin
      out<=in;
    end
endmodule