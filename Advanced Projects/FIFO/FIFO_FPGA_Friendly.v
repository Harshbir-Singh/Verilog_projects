`timescale 1ns / 1ps
module FIFO(
  input clk_p,
  input clk_n,
  input rst, 
  input wr_en,
  input [3:0] wr_data,
  input rd_en,
  output reg [3:0] rd_data,
  output reg full,
  output reg empty
);

  wire clk_ibuf;
  wire clk;  

  IBUFDS #(
      .DIFF_TERM("TRUE"),     
      .IBUF_LOW_PWR("FALSE")  
  ) ibufds_clk (
      .I  (clk_p),
      .IB (clk_n),
      .O  (clk_ibuf)
  );
    
  BUFG bufg_clk (
      .I(clk_ibuf),
      .O(clk)
  );
  reg [1:0] wr_sync, rd_sync;
  reg       wr_sync_d, rd_sync_d;
  reg [20:0] debounce_wr, debounce_rd;
  reg wr_stable, rd_stable;
  reg wr_stable_d, rd_stable_d;

  always @(posedge clk) begin
    wr_sync <= {wr_sync[0], wr_en};
    rd_sync <= {rd_sync[0], rd_en};

    wr_sync_d <= wr_sync[1];
    rd_sync_d <= rd_sync[1];
  end
  always@(posedge clk)
    begin
      if(rst)
        begin
          debounce_wr <=0;
          debounce_rd <=0;
          rd_stable<=0;
          wr_stable<=0;
        end
      else
        begin
          if(wr_sync_d)
            begin
            if(debounce_wr[20]==0)
              begin
                debounce_wr<=debounce_wr+1;
              end
            else wr_stable<=1;                        
            end   
          else
            begin
              debounce_wr<=0; 
              wr_stable<=0;
            end
          if(rd_sync_d)
            begin
            if(debounce_rd[20]==0)
              begin
                debounce_rd<=debounce_rd+1;  
              end
            else
              begin
                rd_stable<=1;
                 
              end          
            end
          else
            begin
              debounce_rd<=0; 
              rd_stable<=0;
            end 
        end
    end
  always@(posedge clk)
    begin
      wr_stable_d<=wr_stable;
      rd_stable_d<=rd_stable;
    end
  wire wr_pulse = wr_stable & ~wr_stable_d;
  wire rd_pulse = rd_stable & ~rd_stable_d;

  reg [3:0] mem [0:511];
  reg [9:0] rd_ptr, wr_ptr;

  wire [8:0] wr_addr = wr_ptr[8:0];
  wire [8:0] rd_addr = rd_ptr[8:0];

  wire [9:0] wr_ptr_next = wr_ptr + (!full  && wr_pulse);
  wire [9:0] rd_ptr_next = rd_ptr + (!empty && rd_pulse);

  always @(posedge clk) begin
    if (rst) begin
      rd_ptr  <= 0;
      wr_ptr  <= 0;
      full    <= 1'b0;
      empty   <= 1'b1;
      rd_data <= 4'b0;
    end else begin
      if (wr_pulse && !full) begin
        mem[wr_addr] <= wr_data;
        wr_ptr <= wr_ptr + 1'b1;
      end
      if (rd_pulse && !empty) begin
        rd_data <= mem[rd_addr];
        rd_ptr <= rd_ptr + 1'b1;
      end
      
      empty <= (wr_ptr_next == rd_ptr_next);
      full  <= (wr_ptr_next[8:0] == rd_ptr_next[8:0] &&
                wr_ptr_next[9]   != rd_ptr_next[9]);
    end
  end

endmodule

