Designed and verified a 32-bit RISC processor based on the MIPS architecture using Verilog. The project focused on implementing a 5-stage pipeline (Fetch, Decode, Execute, Memory, Write-back) to optimize instruction execution.

Key Technical Features:

- Pipeline Architecture: Integrated IF/ID, ID/EX, EX/MEM, and MEM/WB pipeline registers to enable instruction-level parallelism.
- Instruction Set Support: Implemented R-type (ADD, SUB, MUL, SLT), I-type (ADDI, SUBI, SLTI), Data Transfer (LW, SW), and Control Flow (BEQZ, BNEQZ) instructions.
- Memory Organization: Utilized a Harvard Architecture with independent instruction and data memory modules to eliminate structural hazards during simultaneous access.
- Logic Design: Developed a custom ALU, Register File (32 registers), Control Unit, and Sign-Extension logic for 16-bit immediates.
- Verification: Conducted functional verification using a Verilog testbench, simulating real-world instruction sequences and monitoring register-file write-backs.

Tools Used:

- Languages: Verilog 
- Platform: Xilinx Vivado
- Methodology: RTL Design, Digital Logic Design, Functional Verification.
