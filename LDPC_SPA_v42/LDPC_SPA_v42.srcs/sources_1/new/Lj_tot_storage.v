`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 04:10:45
// Design Name: 
// Module Name: Lj_tot_storage
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


module Lj_tot_storage(
        input wire clk,
        input wire rst,
        input wire we,
        input wire [11:0] wr_addr,
        input wire [15:0] wr_data,
        input wire re,
        input wire [11:0] rd_addr,
        output reg [15:0] rd_data
    );
    
    (* ram_style = "block" *) reg [15:0] Lj_total [2559:0];
    integer i;
    
    always @(posedge clk) begin
        if (rst) begin
            for(i=0; i<2560; i=i+1) begin
                Lj_total[i] <= 0;
            end
        end else if (we) begin
            Lj_total[wr_addr] <= wr_data;
        end
    end
    
    always @(posedge clk) begin
        if (re) begin
            rd_data <= Lj_total[rd_addr];
        end
    end
    
endmodule
