set_property PACKAGE_PIN F23 [get_ports clk_p]
set_property PACKAGE_PIN E23 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_n]

create_clock -name clk -period 30.0 [get_ports clk_p]

set_property PACKAGE_PIN F4       [get_ports addr[0]] ;# Bank  88 VCCO - VCC3V3   - IO_L9N_AD11N_88
set_property IOSTANDARD  LVCMOS33 [get_ports addr[0]] ;# Bank  88 VCCO - VCC3V3   - IO_L9N_AD11N_88
set_property PACKAGE_PIN F5       [get_ports addr[1]] ;# 0Bank  88 VCCO - VCC3V3   - IO_L9P_AD11P_88
set_property IOSTANDARD  LVCMOS33 [get_ports addr[1]] ;# Bank  88 VCCO - VCC3V3   - IO_L9P_AD11P_88
set_property PACKAGE_PIN D4       [get_ports din[1]] ;# Bank  88 VCCO - VCC3V3   - IO_L8N_HDGC_88
set_property IOSTANDARD  LVCMOS33 [get_ports din[1]] ;# Bank  88 VCCO - VCC3V3   - IO_L8N_HDGC_88
set_property PACKAGE_PIN E4       [get_ports din[0]] ;# Bank  88 VCCO - VCC3V3   - IO_L8P_HDGC_88
set_property IOSTANDARD  LVCMOS33 [get_ports din[0]]
set_property PACKAGE_PIN B4       [get_ports we] ;# Bank  88 VCCO - VCC3V3   - IO_L7N_HDGC_88
set_property IOSTANDARD  LVCMOS33 [get_ports we] ;# Bank  88 VCCO - VCC3V3   - IO_L7N_HDGC_88
set_property PACKAGE_PIN C4       [get_ports rst] ;# Bank  88 VCCO - VCC3V3   - IO_L7P_HDGC_88
set_property IOSTANDARD  LVCMOS33 [get_ports rst] ;# Bank  88 VCCO - VCC3V3   - IO_L7P_HDGC_88

set_property PACKAGE_PIN G8       [get_ports dout[0]] ;# Bank  87 VCCO - VCC3V3   - IO_L12N_AD0N_87
set_property IOSTANDARD  LVCMOS33 [get_ports dout[0]] ;# Bank  87 VCCO - VCC3V3   - IO_L12N_AD0N_87
set_property PACKAGE_PIN H8       [get_ports dout[1]] ;# Bank  87 VCCO - VCC3V3   - IO_L12P_AD0P_87
set_property IOSTANDARD  LVCMOS33 [get_ports dout[1]] ;# Bank  87 VCCO - VCC3V3   - IO_L12P_AD0P_87
set_property PACKAGE_PIN G7       [get_ports buzz] ;# Bank  87 VCCO - VCC3V3   - IO_L11N_AD1N_87
set_property IOSTANDARD  LVCMOS33 [get_ports buzz] ;# Bank  87 VCCO - VCC3V3   - IO_L11N_AD1N_87