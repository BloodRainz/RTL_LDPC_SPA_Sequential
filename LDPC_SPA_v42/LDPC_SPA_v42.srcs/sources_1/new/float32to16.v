`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.06.2025 18:13:49
// Design Name: 
// Module Name: float32to16
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


module float32to16(
         input  wire        clk,
         input  wire        valid_in,
         input  wire [31:0] float_in,
         output wire [15:0] float16_out,
         output wire        float_valid,
         output wire        ready
    );
    
    
    float2float ut(
          .aclk(clk),
          .s_axis_a_tvalid(valid_in),
          .s_axis_a_tready(ready),
          .s_axis_a_tdata(float_in),
          .m_axis_result_tvalid(float_valid),
          .m_axis_result_tready(1'b1),
          .m_axis_result_tdata(float16_out)
    );
endmodule
