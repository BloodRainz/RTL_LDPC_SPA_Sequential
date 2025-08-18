`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 14:19:32
// Design Name: 
// Module Name: cordic_atanh_ip
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


module cordic_atanh_ip(
        input  wire         clk,
        input  wire         rst_n,
        input  wire         valid_in,
        input  wire [31:0]  in_data,
        output wire         valid_out,
        output wire [15:0]  out_data,
        output wire         ready_in
    );
    
    wire ready_out = 1'b1;

    cordic_atanh dut (
        .aclk(clk),
        .aresetn(rst_n),
        .s_axis_cartesian_tvalid(valid_in),
        .s_axis_cartesian_tready(ready_in),
        .s_axis_cartesian_tdata(in_data),
        .m_axis_dout_tvalid(valid_out),
        .m_axis_dout_tready(ready_out),
        .m_axis_dout_tdata(out_data)
    );

    
endmodule
