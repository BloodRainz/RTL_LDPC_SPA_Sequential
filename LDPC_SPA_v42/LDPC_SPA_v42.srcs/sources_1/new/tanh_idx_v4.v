`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2025 01:10:58
// Design Name: 
// Module Name: tanh_idx_v4
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


module tanh_idx_v4(
        input wire [15:0] input_fixed,
        output reg [9:0] index 
    );
    
    always @(*) begin
    if(input_fixed[15])
        index = (input_fixed*100/1024) -6000;
    else
        index = (input_fixed*100/1024) +400;
    end
    
endmodule

