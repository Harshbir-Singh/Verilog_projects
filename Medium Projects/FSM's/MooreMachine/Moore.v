//2 process methodology
module top1(clk,rst,din,dout);
  input clk,rst,din;
  output reg dout;
  
  parameter idle = 0;
  parameter s0 = 1;
  parameter s1 = 2;
  parameter s2 = 3;
  parameter s3 = 4;
  parameter s4 = 5;
  
  reg [4:0] state = idle,nstate = idle;
  
  always@(posedge clk)
    begin
      if(rst == 1'b1)  
        state <= idle;  
      else
        state <= nstate;
    end
  always@(state,din)
    begin
      
      case(state)
        idle:
          begin
            nstate = s0;
            dout = 1'b0;
          end
        s0:
          begin
            if(din == 1'b0)
              begin
                nstate = s0;
                dout = 1'b0;
              end
            else
              begin
                nstate = s1;
                dout = 1'b0;
              end
          end
        s1:
          begin
            if(din == 1'b0)
              begin
                nstate = s2;
                dout = 1'b0;
              end
            else
              begin
                nstate = s1;
                dout = 1'b0;
              end
          end
        s2:
          begin
            if(din == 1'b0)
              begin
                nstate = s3;
                dout = 1'b0;
              end
            else
              begin
                nstate = s1;
                dout = 1'b0;
              end
          end
        s3:
          begin
            if(din == 1'b0)
              begin
                nstate = s0;
                dout = 1'b0;
              end
            else
              begin
                nstate = s4;
                dout = 1'b1;
              end
          end
        s4:
          begin
            if(din == 1'b0)
              begin
                nstate = s0;
                dout = 1'b0;
              end
            else
              begin
                nstate = s1;
                dout = 1'b0;
              end
          end
      endcase
    end
endmodule