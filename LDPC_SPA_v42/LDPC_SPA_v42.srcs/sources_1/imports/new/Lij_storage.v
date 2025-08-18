`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 06:34:58
// Design Name: 
// Module Name: Lij_storage
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


module Lij_storage(
        input wire clk,
        input wire rst,
        //write ports
        input wire we, //write enable
        input wire [11:0] row_wr_addr,
        input wire [2:0] col_wr_addr,
        input wire [15:0] Lij_write_data,
        //read ports
        input wire re,
        input wire [11:0] row_rd_addr,
        input wire [2:0] col_rd_addr,
        output reg [15:0] Lij_read_data
        
    );
    
    (* ram_style = "block" *) reg [15:0] Lij_memory [0:1535][0:5];
    integer i,j;
    
    always @(posedge clk) begin
        if (rst) begin
            for (i=0; i<1536; i=i+1) begin
                for (j=0; j<6; j=j+1) begin
                    Lij_memory[i][j] <= 12'h000;
                end
            end
        end else if (we) begin
            Lij_memory[row_wr_addr][col_wr_addr] <= Lij_write_data;
        end
    end
    
    always @(posedge clk) begin
        if (re) begin
            Lij_read_data <= Lij_memory[row_rd_addr][col_rd_addr];
        end
    end
    
endmodule
