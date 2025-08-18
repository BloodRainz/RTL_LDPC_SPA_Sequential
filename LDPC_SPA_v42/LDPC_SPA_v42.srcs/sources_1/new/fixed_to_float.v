`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 17:47:48
// Design Name: 
// Module Name: fixed_to_float
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


module fixed_to_float(
         input  wire        clk,
         input  wire        valid_fixed,
         input  wire [15:0] fixed_in,
         output wire [31:0] float_out,
         output wire        float_valid,
         output wire        ready
    );
    
    
    fixed2float uut(
          .aclk(clk),
          .s_axis_a_tvalid(valid_fixed),
          .s_axis_a_tready(ready),
          .s_axis_a_tdata(fixed_in),
          .m_axis_result_tvalid(float_valid),
          .m_axis_result_tready(1'b1),
          .m_axis_result_tdata(float_out)
    );
    
    
endmodule
