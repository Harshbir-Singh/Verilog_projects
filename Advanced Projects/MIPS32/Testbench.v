`timescale 1ns / 1ps

module tb;
  reg clk1, clk2;
  reg [15:0] value;
  pipe_MIPS32 dut(.clk1(clk1),.clk2(clk2));
  
  initial 
    begin
      clk1 =0 ; clk2 = 0;
      forever
        begin
          #5 clk1 = 1; #5 clk1 = 0;
          #5 clk2 = 1; #5 clk2 = 0;
        end
    end
  initial 
    begin
      dut.PC = 32'd0;
      dut.IF_ID_IR = 32'd0; 
      dut.IF_ID_NPC = 32'd0;
      
      dut.ID_EX_IR = 32'd0;
      dut.ID_EX_NPC = 32'd0;
      dut.ID_EX_A = 32'd0; 
      dut.ID_EX_B = 32'd0;
      dut.ID_EX_Imm = 32'd0;
      
      dut.ID_EX_type = 3'd0; 
      dut.EX_MEM_type = 3'd0; 
      dut.MEM_WB_type = 3'd0;
      
      dut.EX_MEM_IR = 32'd0; 
      dut.EX_MEM_ALUOut = 32'd0; 
      dut.EX_MEM_B = 32'd0;
      
      dut.MEM_WB_IR = 32'd0; 
      dut.MEM_WB_ALUOut = 32'd0;
      dut.MEM_WB_LMD = 32'd0;
      
      dut.HALTED = 1'b0;
      dut.TAKEN_BRANCH = 1'b0;
      dut.EX_MEM_Cond = 1'd0;
    end
    
  initial 
    begin
      //Examples of RR-ALU
      dut.IMem[0] = 32'h00432800;
      dut.IMem[1] = 32'h04433800;
      dut.IMem[2] = 32'h14434800;
      dut.Reg[2] = 32'd6;
      dut.Reg[3] = 32'd4;
      
      #300
      $display("ADD: R2 = %d, R3 = %d, R5 = %d", dut.Reg[2], dut.Reg[3], dut.Reg[5]);
      $display("SUB: R2 = %d, R3 = %d, R7 = %d", dut.Reg[2], dut.Reg[3], dut.Reg[7]);
      $display("MUL: R2 = %d, R3 = %d, R9 = %d", dut.Reg[2], dut.Reg[3], dut.Reg[9]);
 
    end
  initial
    begin
      //Examples of RM-ALU
      dut.IMem[3] = 32'h284B0003;
      dut.IMem[4] = 32'h304D0003;
      value = 16'h0003;
      
      repeat (10) @(posedge clk1);
      $display("ADDI: R2 = %d, value = %d, R11 = %d", dut.Reg[2], value, dut.Reg[11]);
      $display("SLTI: R2 = %d, value = %d, R13 = %d", dut.Reg[2], value, dut.Reg[13]);
    end
    
endmodule
