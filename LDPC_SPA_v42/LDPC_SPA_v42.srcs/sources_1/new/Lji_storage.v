`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.07.2025 15:50:28
// Design Name: 
// Module Name: Lji_storage
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


module Lji_storage(
        input wire clk,
        input wire rst,
        //write ports
        input wire we, //write enable
        input wire [11:0] col_wr_addr,
        input wire [2:0] rowpos_wr_addr,
        input wire [15:0] Lji_write_data,
        //read ports
        input wire re,
        input wire [11:0] col_rd_addr,
        input wire [2:0] rowpos_rd_addr,
        output reg [15:0] Lji_read_data,
        output reg init_done,
        output reg [11:0] llr_addr, 
        input wire [15:0] llr_data 
    );
    
    (* ram_style = "block" *) reg [15:0] Lji_memory [0:2559][0:5];
    reg [11:0] init_i;
    reg [2:0]  init_j;
    //reg init_done;
    reg init_active;
//    wire [15:0] llr_data; 
//    wire [15:0] llr_data; 
    
//    llr_float_data rx_data_initial(
//        .address(llr_addr),
//        .llr_fdata(llr_data)
//    );
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            init_active <= 1;
            init_i <= 0;
            init_j <= 0;
            llr_addr <= 0;
            init_done <= 0;
        end else if (init_active) begin
            // Assign to memory from llr_data (assume 1-cycle delay is acceptable)
            Lji_memory[init_i][init_j] <= llr_data;
    
            // Step to next column
            if (init_j < 5)
                init_j <= init_j + 1;
            else begin
                init_j <= 0;
                init_i <= init_i + 1;
                llr_addr <= init_i + 1;
            end
    
            // Stop when all are done
            if (init_i == 2559 && init_j == 5) begin
                init_active <= 0;
                init_done <= 1;
            end
        end else if (init_done & we) begin
            Lji_memory[col_wr_addr][rowpos_wr_addr] <= Lji_write_data;
        end
    end
    
    always @(posedge clk) begin
        if (re) begin
            Lji_read_data <= Lji_memory[col_rd_addr][rowpos_rd_addr];
        end
    end
    
endmodule
