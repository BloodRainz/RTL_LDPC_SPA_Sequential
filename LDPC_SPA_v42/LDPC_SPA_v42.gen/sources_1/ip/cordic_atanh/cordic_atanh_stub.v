// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Jun 18 05:35:40 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top cordic_atanh -prefix
//               cordic_atanh_ cordic_atanh_stub.v
// Design      : cordic_atanh
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_20,Vivado 2023.2" *)
module cordic_atanh(aclk, aresetn, s_axis_cartesian_tvalid, 
  s_axis_cartesian_tready, s_axis_cartesian_tdata, m_axis_dout_tvalid, 
  m_axis_dout_tready, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aresetn,s_axis_cartesian_tvalid,s_axis_cartesian_tready,s_axis_cartesian_tdata[31:0],m_axis_dout_tvalid,m_axis_dout_tready,m_axis_dout_tdata[15:0]" */
/* synthesis syn_force_seq_prim="aclk" */;
  input aclk /* synthesis syn_isclock = 1 */;
  input aresetn;
  input s_axis_cartesian_tvalid;
  output s_axis_cartesian_tready;
  input [31:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  input m_axis_dout_tready;
  output [15:0]m_axis_dout_tdata;
endmodule
