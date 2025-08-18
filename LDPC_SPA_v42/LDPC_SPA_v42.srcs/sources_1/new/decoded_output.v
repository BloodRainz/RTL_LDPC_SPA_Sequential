`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 03:12:13
// Design Name: 
// Module Name: decoded_output
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


module decoded_output(
        input wire clk,
        input wire rst,
        input wire we,
        input wire [11:0] wr_addr,
        input wire [15:0] wr_data,
        input wire re,
        input wire [11:0] rd_addr,
        output reg [15:0] rd_data
    );
    
    reg [15:0] 
    integer i;
    
    always @(posedge clk) begin
        if (rst) begin
            for(i=0; i<2559; i=i+1) begin
                
            end
        end
    end
    
endmodule
