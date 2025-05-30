`timescale 1ns / 1ps
module mux41(out,a,b,c,d,s);
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


// Created an IP of 4X1 MUX to design the complete barrel shifter