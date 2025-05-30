`timescale 1ns / 1ps
module mux4X1(out,a,b,c,d,s);
  input a,b,c,d;
  input [1:0]s;
  output reg out;
  
  always@(*)
    begin
      case(s)
        2'b00: out= a;
        2'b01: out= b;
        2'b10: out= c;
        2'b11: out= d;
        default: out = 1'b0;
      endcase
    end
  
  
endmodule


module mux21(in1,in2,out,s);
  input in1,in2,s;
  output out;
  assign out = (s==1'b0)?in1:in2;
endmodule