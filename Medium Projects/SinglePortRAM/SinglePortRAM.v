module RAM(clk_p,clk_n,rst,we,din,dout,addr,buzz);
  input wire clk_p,clk_n;
  input rst,we;
  wire clk;        // Differential clock input (positive)
  output reg buzz;
  input [1:0] addr,din;
  output reg [1:0]dout;
  
  IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("FALSE")
    ) ibufds_inst (
        .O(clk),
        .I(clk_p),
        .IB(clk_n)
    );
  
  reg [1:0]mem[0:3];
  integer i;
  always@(posedge clk)
 
    begin
      buzz <= 1'b0;
      if(rst==1'b1)
        begin
         buzz<=1'b1;
         dout<=2'b00;
         for(i=0;i<64;i=i+1)
           begin
            mem[i]<=2'b00;
           end
        end
      else
        if(we==1'b1)
          begin
            mem[addr] <= din;
          end
        else 
          begin
            dout <= mem[addr];  
            
          end
   end
endmodule
