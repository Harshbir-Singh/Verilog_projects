`timescale 1ns / 1ps
module tb();
  logic clk, rst, wr_en, rd_en;
  wire full, empty;
  logic [7:0] wr_data;
  wire [7:0] rd_data;
  logic [7:0] exp_q[$];   

  FIFO dut(.clk(clk),.rst(rst),.wr_en(wr_en),.wr_data(wr_data),.rd_en(rd_en),.rd_data(rd_data),.full(full),.empty(empty));
  
  initial
    begin
      clk = 1;
      forever #5clk = ~clk;
    end
    
  initial
    begin
      rst = 1;
      @(posedge clk)rst = 0;
    end
  
  initial
    begin
   
      #10
      wr_en = 0;
      rd_en = 0;
      wr_data = 0;
      // Read and write for 1 element 
      @(posedge clk)
        begin
          wr_en = 1;
          wr_data = $urandom_range(255);
          exp_q.push_back(wr_data);
        end
      #10 wr_en = 0; #10rd_en = 1; #10check_output();
      
      // Burst Writing 
      repeat(10) begin
        @(posedge clk)
           begin
             rd_en = 0;
             wr_en = 1;
             wr_data = $urandom_range(255);
             exp_q.push_back(wr_data);
           end
        #10 wr_en = 0;
      end
      //Burst Read
      repeat(5) begin
        #10 rd_en = 1;#10check_output();
      end
      //Simulatneous Read and Write
      @(posedge clk)
           begin 
             wr_en = 1;
             wr_data = $urandom_range(255);
             exp_q.push_back(wr_data);
             rd_en = 1;
            
           end
      @(posedge clk)
          check_output();
      #10 wr_en = 0;rd_en = 0;
      // Checking Empty Flag
      repeat(7) begin
        #10 rd_en = 1;
        #10check_output();
      end
      $finish();  
    end
  task check_output;
      logic [7:0] expected;
      begin
        if (rd_en && !empty) begin
          expected = exp_q.pop_front();
          if (rd_data !== expected)
            $display("ERROR: exp=%0h got=%0h at time %0t", expected, rd_data, $time);
          else
            $display("PASS: data=%0h at time %0t", rd_data, $time);
        end
        else if (rd_en && empty) begin
          $display("READ attempted when FIFO EMPTY at time %0t", $time);
        end
        
      end
  endtask


endmodule
