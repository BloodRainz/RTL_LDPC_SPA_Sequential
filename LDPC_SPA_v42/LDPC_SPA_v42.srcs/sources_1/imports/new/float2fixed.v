`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2025 13:49:03
// Design Name: 
// Module Name: float2fixed
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


module float2fixed(
         input  wire        clk,
         input  wire        valid_float,
         input  wire [15:0] float_in,
         output wire [15:0] fixed_out,
         output wire        fixed_valid,
         output wire        ready
    );

    
    float_to_fixed fixed(
          .aclk(clk),
          .s_axis_a_tvalid(valid_float),
          .s_axis_a_tready(ready),
          .s_axis_a_tdata(float_in),
          .m_axis_result_tvalid(fixed_valid),
          .m_axis_result_tready(1'b1),
          .m_axis_result_tdata(fixed_out)
    );
    
endmodule
