`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2025 18:21:52
// Design Name: 
// Module Name: float2fixed_t
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module float2fixed_t(
         input  wire        clk,
         input  wire        valid_float,
         input  wire [15:0] float_in,
         output wire [15:0] fixed_out,
         output wire        fixed_valid,
         output wire        ready
    );

    
    float2fixed_idx fixed(
          .aclk(clk),
          .s_axis_a_tvalid(valid_float),
          .s_axis_a_tready(ready),
          .s_axis_a_tdata(float_in),
          .m_axis_result_tvalid(fixed_valid),
          .m_axis_result_tready(1'b1),
          .m_axis_result_tdata(fixed_out)
    );
    
endmodule
