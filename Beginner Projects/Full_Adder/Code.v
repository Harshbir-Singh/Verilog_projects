module FullAdder(S,C,A,B,Cin);
  input A,B,Cin;
  output S,C;

  assign S = A^B^Cin;
  assign C = ((A^B)&Cin) |(A&B);

endmodule

module testbench;
  reg A,B,Cin;
  wire S,C;
  FullAdder FA(S,C,A,B,Cin);

  initial 
    begin 
      A = 0;
      B = 0;
      Cin = 0;
    end

  initial 
    begin 
      $monitor("For A = %d, B = %d, Cin = %d   Sum = %d Carry = %d",A,B,Cin,S,C);
      #2 A = 0; B = 0; Cin = 1;
      #2 A = 0; B = 1; Cin = 0;
      #2 A = 0; B = 1; Cin = 1;
      #2 A = 1; B = 0; Cin = 0;
      #2 A = 1; B = 0; Cin = 1;
      #2 A = 1; B = 1; Cin = 0;
      #2 A = 1; B = 1; Cin = 1;

      #5$finish;
    end
endmodule