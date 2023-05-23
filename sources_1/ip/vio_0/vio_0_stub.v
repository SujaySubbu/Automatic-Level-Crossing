// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Dec  7 16:23:36 2021
// Host        : LAPTOP-Q6APEN03 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/krishna/OneDrive/Desktop/ECE/FPGA/fpga_project_2/fpga_project_2.srcs/sources_1/ip/vio_0/vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2018.2" *)
module vio_0(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_in8)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[0:0],probe_in1[3:0],probe_in2[3:0],probe_in3[3:0],probe_in4[3:0],probe_in5[0:0],probe_in6[0:0],probe_in7[0:0],probe_in8[0:0]" */;
  input clk;
  input [0:0]probe_in0;
  input [3:0]probe_in1;
  input [3:0]probe_in2;
  input [3:0]probe_in3;
  input [3:0]probe_in4;
  input [0:0]probe_in5;
  input [0:0]probe_in6;
  input [0:0]probe_in7;
  input [0:0]probe_in8;
endmodule