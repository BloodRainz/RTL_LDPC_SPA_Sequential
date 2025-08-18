`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 23:08:14
// Design Name: 
// Module Name: float_multiply
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


module float_multiply(
        input wire clk,
        input wire rst,
        input wire [15:0] a_in, // Half-precision IEEE 754 input
        input wire [15:0] b_in,
        input wire valid_in,
        output wire [15:0] result_out,
        output wire result_valid,
        output wire ready_a,
        output wire ready_b
    );
    
    //wire ready_a, ready_b;
    
    //assign result_valid = valid_result;
    
    floating_mul_half mul_inst (
        .aclk(clk),

        .s_axis_a_tvalid(valid_in),
        .s_axis_a_tready(ready_a),
        .s_axis_a_tdata(a_in),

        .s_axis_b_tvalid(valid_in),
        .s_axis_b_tready(ready_b),
        .s_axis_b_tdata(b_in),

        .m_axis_result_tvalid(result_valid),
        .m_axis_result_tready(1'b1), // Ready to accept result
        .m_axis_result_tdata(result_out)
    );
    
endmodule
