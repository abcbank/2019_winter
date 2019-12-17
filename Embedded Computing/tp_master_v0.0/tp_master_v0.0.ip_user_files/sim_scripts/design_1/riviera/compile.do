vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_1
vlib riviera/axi_vip_v1_1_1
vlib riviera/processing_system7_vip_v1_0_3
vlib riviera/lib_pkg_v1_0_2
vlib riviera/fifo_generator_v13_2_1
vlib riviera/lib_fifo_v1_0_10
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/lib_cdc_v1_0_2
vlib riviera/axi_datamover_v5_1_17
vlib riviera/axi_sg_v4_1_8
vlib riviera/axi_dma_v7_1_16
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_15
vlib riviera/axi_data_fifo_v2_1_14
vlib riviera/axi_crossbar_v2_1_16
vlib riviera/axi_protocol_converter_v2_1_15
vlib riviera/axi_clock_converter_v2_1_14
vlib riviera/blk_mem_gen_v8_4_1
vlib riviera/axi_dwidth_converter_v2_1_15

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_1 riviera/axi_protocol_checker_v2_0_1
vmap axi_vip_v1_1_1 riviera/axi_vip_v1_1_1
vmap processing_system7_vip_v1_0_3 riviera/processing_system7_vip_v1_0_3
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap fifo_generator_v13_2_1 riviera/fifo_generator_v13_2_1
vmap lib_fifo_v1_0_10 riviera/lib_fifo_v1_0_10
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap axi_datamover_v5_1_17 riviera/axi_datamover_v5_1_17
vmap axi_sg_v4_1_8 riviera/axi_sg_v4_1_8
vmap axi_dma_v7_1_16 riviera/axi_dma_v7_1_16
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_15 riviera/axi_register_slice_v2_1_15
vmap axi_data_fifo_v2_1_14 riviera/axi_data_fifo_v2_1_14
vmap axi_crossbar_v2_1_16 riviera/axi_crossbar_v2_1_16
vmap axi_protocol_converter_v2_1_15 riviera/axi_protocol_converter_v2_1_15
vmap axi_clock_converter_v2_1_14 riviera/axi_clock_converter_v2_1_14
vmap blk_mem_gen_v8_4_1 riviera/blk_mem_gen_v8_4_1
vmap axi_dwidth_converter_v2_1_15 riviera/axi_dwidth_converter_v2_1_15

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_I_BRAM_0.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_O_BRAM_0.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_W_BRAM_0_0.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_mac_mulacud.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_mac_muladEe.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_mac_mulafYi.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_mul_mul_bkb.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2_mux_42_1eOg.v" \
"../../../bd/design_1/ipshared/b79d/computation.v" \
"../../../bd/design_1/ipshared/b79d/data_transfer_f.v" \
"../../../bd/design_1/ipshared/b79d/data_transfer_i.v" \
"../../../bd/design_1/ipshared/b79d/data_transfer_ofo.v" \
"../../../bd/design_1/ipshared/b79d/HLS2x4_2.v" \
"../../../bd/design_1/ip/design_1_HLS2x4_2_0_0/sim/design_1_HLS2x4_2_0_0.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_1  -sv2k12 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/3b24/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_1  -sv2k12 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/a16a/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_3  -sv2k12 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/5c35/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_1 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_1  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/5c35/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_10 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/f10a/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_datamover_v5_1_17 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/71f3/hdl/axi_datamover_v5_1_vh_rfs.vhd" \

vcom -work axi_sg_v4_1_8 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/5f94/hdl/axi_sg_v4_1_rfs.vhd" \

vcom -work axi_dma_v7_1_16 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/bf8c/hdl/axi_dma_v7_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_dma_0_0/sim/design_1_axi_dma_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_1_1/sim/design_1_axi_dma_1_1.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_2_2/sim/design_1_axi_dma_2_2.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_15  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/3ed1/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_14  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/9909/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_16  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/c631/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_xbar_1/sim/design_1_xbar_1.v" \
"../../../bd/design_1/ip/design_1_xbar_0/sim/design_1_xbar_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_dma_3_0/sim/design_1_axi_dma_3_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_4_0/sim/design_1_axi_dma_4_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_5_0/sim/design_1_axi_dma_5_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_I_BRAM_0.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_O_BRAM_0.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_W_BRAM_0_0.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_mac_mulacud.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_mac_muladEe.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_mac_mulafYi.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_mul_mul_bkb.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3_mux_42_1eOg.v" \
"../../../bd/design_1/ipshared/0014/computation.v" \
"../../../bd/design_1/ipshared/0014/data_transfer_f.v" \
"../../../bd/design_1/ipshared/0014/data_transfer_i.v" \
"../../../bd/design_1/ipshared/0014/data_transfer_ofo.v" \
"../../../bd/design_1/ipshared/0014/HLS2x4_3.v" \
"../../../bd/design_1/ip/design_1_HLS2x4_3_0_0/sim/design_1_HLS2x4_3_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_dma_6_0/sim/design_1_axi_dma_6_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_7_0/sim/design_1_axi_dma_7_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_8_0/sim/design_1_axi_dma_8_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_I_BRAM_0.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_O_BRAM_0.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_W_BRAM_0_0.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_mac_mulacud.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_mac_muladEe.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_mac_mulafYi.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_mul_mul_bkb.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4_mux_42_1eOg.v" \
"../../../bd/design_1/ipshared/dc55/computation.v" \
"../../../bd/design_1/ipshared/dc55/data_transfer_f.v" \
"../../../bd/design_1/ipshared/dc55/data_transfer_i.v" \
"../../../bd/design_1/ipshared/dc55/data_transfer_ofo.v" \
"../../../bd/design_1/ipshared/dc55/HLS2x4_4.v" \
"../../../bd/design_1/ip/design_1_HLS2x4_4_0_0/sim/design_1_HLS2x4_4_0_0.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_I_BRAM_0.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_O_BRAM_0.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_W_BRAM_0_0.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_mac_mulacud.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_mac_muladEe.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_mac_mulafYi.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_mul_mul_bkb.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5_mux_42_1eOg.v" \
"../../../bd/design_1/ipshared/27c2/computation.v" \
"../../../bd/design_1/ipshared/27c2/data_transfer_f.v" \
"../../../bd/design_1/ipshared/27c2/data_transfer_ofo.v" \
"../../../bd/design_1/ipshared/27c2/HLS2x4_5.v" \
"../../../bd/design_1/ip/design_1_HLS2x4_5_0_0/sim/design_1_HLS2x4_5_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_axi_dma_9_0/sim/design_1_axi_dma_9_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_10_0/sim/design_1_axi_dma_10_0.vhd" \
"../../../bd/design_1/ip/design_1_axi_dma_11_0/sim/design_1_axi_dma_11_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work axi_protocol_converter_v2_1_15  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ff69/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_pc_1/sim/design_1_auto_pc_1.v" \

vlog -work axi_clock_converter_v2_1_14  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/445f/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/67d8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_15  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1cdc/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/02c8/hdl/verilog" "+incdir+../../../../tp_master_v0.0.srcs/sources_1/bd/design_1/ipshared/1313/hdl" "+incdir+C:/Xilinx/Vivado/2017.4/data/xilinx_vip/include" \
"../../../bd/design_1/ip/design_1_auto_us_11/sim/design_1_auto_us_11.v" \
"../../../bd/design_1/ip/design_1_auto_us_10/sim/design_1_auto_us_10.v" \
"../../../bd/design_1/ip/design_1_auto_us_9/sim/design_1_auto_us_9.v" \
"../../../bd/design_1/ip/design_1_auto_us_8/sim/design_1_auto_us_8.v" \
"../../../bd/design_1/ip/design_1_auto_us_7/sim/design_1_auto_us_7.v" \
"../../../bd/design_1/ip/design_1_auto_us_6/sim/design_1_auto_us_6.v" \
"../../../bd/design_1/ip/design_1_auto_us_5/sim/design_1_auto_us_5.v" \
"../../../bd/design_1/ip/design_1_auto_us_4/sim/design_1_auto_us_4.v" \
"../../../bd/design_1/ip/design_1_auto_us_3/sim/design_1_auto_us_3.v" \
"../../../bd/design_1/ip/design_1_auto_us_2/sim/design_1_auto_us_2.v" \
"../../../bd/design_1/ip/design_1_auto_us_1/sim/design_1_auto_us_1.v" \
"../../../bd/design_1/ip/design_1_auto_us_0/sim/design_1_auto_us_0.v" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

