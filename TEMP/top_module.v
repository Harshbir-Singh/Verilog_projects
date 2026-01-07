module top_module(
  input clkp,
  input clkn,
  input reset_n
);
  wire clk;
  wire reset;
  IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("FALSE")
    ) ibufds_inst (
        .O(clk),
        .I(clkp),
        .IB(clkn)
    );
  assign reset = ~reset_n;
  pipe_MIPS32 cpu (
    .clk(clk),
    .reset(reset)
  );

  ila_0 ila (
    .clk(clk),
    .probe0(cpu.PC),
    .probe1(cpu.MEM_WB_ALUOut),
    .probe2(cpu.MEM_WB_IR),
    .probe3(cpu.MEM_WB_type),
    .probe4(cpu.HALTED)
  );

endmodule
