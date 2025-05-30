//64X8 64- depth and 8-size
module RAM(clk,addr,we,rst,din,dout);
  input clk,we,rst;
  output reg [7:0]dout;
  input [7:0]din;
  input [5:0]addr;
  reg [7:0] mem[63:0];
  integer i;
  
  always@(posedge clk)
    begin
      if(rst == 1'b1)
        begin
          for(i=0;i<64;i = i+1)
            begin
              mem[i] <= 8'h00;
            end
          dout <= 8'h00;
        end
      else
        begin
          if(we == 1'b1)
            mem[addr] <= din;
          else
            dout <= mem[addr];
        end
    end
    
endmodule