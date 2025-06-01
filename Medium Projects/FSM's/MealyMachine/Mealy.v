//1 process methodology
module mealy(clk,rst,din,dout);
  input clk,rst,din;
  output reg dout;
  
  parameter idle = 0;
  parameter s0 = 1;
  parameter s1 = 2;
  parameter s2 = 3;

  
  reg [2:0] state = idle;
  
  always@(posedge clk)
    begin 
      if(rst == 1'b1)
        begin
          state <= idle;
        end
      else
        case(state) 
          idle: 
            begin
              state=s0;
              dout=1'b0;
            end
          s0:
            begin
              if(din==1'b0)
                begin
                  state = s2;
                  dout = 1'b0;
                end
              else
                begin
                  state = s1;
                  dout = 1'b0;
                end
            end
          s1:
            begin
              if(din==1'b0)
                begin
                  state = s2;
                  dout = 1'b0;
                end
              else
                begin
                  state = s1;
                  dout = 1'b1;
                end
            end
          s2:
            begin
              if(din==1'b0)
                begin
                  state = s2;
                  dout = 1'b0;
                end
              else
                begin
                  state = s1;
                  dout = 1'b0;
                end
            end
        endcase
    end
endmodule
