`timescale 1ns / 1ps
module Traffic(clk,rst,emerg,out,traffic1, traffic2, traffic3, red, green, yellow);
  input clk,rst,emerg;
  input [15:0] traffic1, traffic2, traffic3;
  parameter road1=2'b00, road2=2'b01, road3=2'b10;
  reg [1:0] state, next_state;
  output reg [2:0]red, green, yellow;
  output reg [15:0] out;
  
  initial
    begin
      red=3'b111;
      green=3'b000;
      yellow=3'b000;
    end
  always@(posedge clk)
    begin
      if(rst == 1'b1)
        state<=road1;
      else
        state<=next_state;
    end
  always@(*)
    begin
    if(emerg == 1'b1)
      if(traffic1>traffic2 && traffic1>traffic3)
          next_state=road1;
      else if(traffic2>traffic1 && traffic2>traffic3)
          next_state=road2;
      else
          next_state=road3;
    else
      begin
      case(state)
        road1:next_state=road2;
        road2:next_state=road3;
        road3:next_state=road1;   
      endcase
      end
     end
    always@(*)
      begin
        case(state)
        road1:begin
                red[0]=0;
                green[0]=1;
                yellow[0]=0;
                red[1]=0;
                green[1]=0;
                yellow[1]=1;
                red[2]=1;
                green[2]=0;
                yellow[2]=0;
              end
        road2:begin
                red[0]=1;
                green[0]=0;
                yellow[0]=0;
                red[1]=0;
                green[1]=1;
                yellow[1]=0;
                red[2]=0;
                green[2]=0;
                yellow[2]=1;
              end
        road3:begin
                red[0]=0;
                green[0]=0;
                yellow[0]=1;
                red[1]=1;
                green[1]=0;
                yellow[1]=0;
                red[2]=0;
                green[2]=1;
                yellow[2]=0;
              end
        endcase
      end
    always@(*)
    begin
      if(rst == 1'b1)
        out=traffic1;
      else
      begin
        case(state)
          road1:out=traffic1;
          road2:out=traffic2;
          road3:out=traffic3;
        endcase
      end
    end
endmodule
