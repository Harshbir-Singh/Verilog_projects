module RippleCarryAdder(S,Cout,A,B,Cin);
  input [3:0]A,B;
  input Cin;
  output [3:0]S;
  output Cout;
  wire C1,C2,C3;

  FullAdder FA1(S[0],C1,A[0],B[0],Cin);
  FullAdder FA2(S[1],C2,A[1],B[1],C1);
  FullAdder FA3(S[2],C3,A[2],B[2],C2);
  FullAdder FA4(S[3],Cout,A[3],B[3],C3);

endmodule

module FullAdder(S,C,A,B,Cin);
  input A,B,Cin;
  output S,C;

  assign S = A^B^Cin;
  assign C = ((A^B)&Cin) |(A&B);

endmodule


module testbench;
  reg [3:0]A,B;
  reg Cin;
  wire [3:0]S;
  wire Cout;
  RippleCarryAdder test(S,Cout,A,B,Cin);

  initial
    begin
      Cin = 0;
      A = 4'b0000;
      B = 4'b0000;
      $monitor("For Input A = %b, B = %b, Cin = %b -----> Cout = %b, S = %b", A, B, Cin, Cout, S);
      #2 A = 4'b0000; B = 4'b1111;
      #2 A = 4'b1010; B = 4'b0011;
      #2 A = 4'b1111; B = 4'b1111;
      #3 $finish;
    end
endmodule