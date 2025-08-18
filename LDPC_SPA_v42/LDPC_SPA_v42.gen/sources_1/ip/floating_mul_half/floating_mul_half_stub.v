// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Wed Jul 16 14:00:48 2025
// Host        : LAPTOP-3T4U0UNN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Vivado_files/Master_thesis/LDPC_SPA_v23/LDPC_SPA_v23.gen/sources_1/ip/floating_mul_half/floating_mul_half_stub.v
// Design      : floating_mul_half
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "floating_point_v7_1_16,Vivado 2023.2" *)
module floating_mul_half(aclk, s_axis_a_tvalid, s_axis_a_tready, 
  s_axis_a_tdata, s_axis_b_tvalid, s_axis_b_tready, s_axis_b_tdata, m_axis_result_tvalid, 
  m_axis_result_tready, m_axis_result_tdata)
/* synthesis syn_black_box black_box_pad_pin="s_axis_a_tvalid,s_axis_a_tready,s_axis_a_tdata[15:0],s_axis_b_tvalid,s_axis_b_tready,s_axis_b_tdata[15:0],m_axis_result_tvalid,m_axis_result_tready,m_axis_result_tdata[15:0]" */
/* synthesis syn_force_seq_prim="aclk" */;
  input aclk /* synthesis syn_isclock = 1 */;
  input s_axis_a_tvalid;
  output s_axis_a_tready;
  input [15:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  output s_axis_b_tready;
  input [15:0]s_axis_b_tdata;
  output m_axis_result_tvalid;
  input m_axis_result_tready;
  output [15:0]m_axis_result_tdata;
endmodule
