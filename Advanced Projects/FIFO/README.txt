**Synchronous FIFO IP Core**
512×8-bit synchronous FIFO with SystemVerilog verification and FPGA deployment on Zynq ZCU104.


Features:
Capacity: 512 entries × 8-bit data width
Clock: 100 MHz synchronous operation
Resources: 34 LUTs, 22 FFs, 0.5 BRAM
Flags: Full and empty indicators with wrap-around logic
Verified: Self-checking SystemVerilog testbench with queue-based reference model

MODULES:
- FIFO Core (FIFO.v)
512×8-bit memory array
10-bit read/write pointers (MSB for wrap-around detection)
Combinational flag generation for zero-cycle latency
Simultaneous read/write support

- Verification:
SystemVerilog testbench with:
Queue-based golden reference model
Randomized stimulus generation
Self-checking mechanism
Coverage for corner cases (empty, simultaneous R/W, R/W combinations)

- Top Module (top_module.v)
Differential clock input (IBUFDS/BUFG)
Button debounce logic (~21ms at 100MHz)
Edge detection for single-cycle pulses
Instantiates FIFO IP core with 4-bit interface



Hardware Demo:
Board: Zynq ZCU104
Interface:

DIP Switches [3:0] → Write data
Buttons → Write/Read enable, Reset
LEDs [3:0] → Read data output
LEDs → Full/Empty status indicators


Video: https://go.screenpal.com/watch/cOVrbBn3egt
