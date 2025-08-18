`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 16:44:25
// Design Name: 
// Module Name: SPA_top_v2
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


module SPA_top_v2(

    );
    
    reg clk= 0;
    reg rst;
    wire done;
    reg start;
    
    wire lij_we;
    wire [11:0] lij_row_wr_addr;
    wire [2:0] lij_col_wr_addr;
    wire [12:0] Lij_write_data;
    reg [11:0] lij_row_rd_addr;
    reg [2:0] lij_col_rd_addr;
    reg lij_re;
    wire [12:0] Lij_read_data;
    
    always #5 clk = ~clk;
    
    
    Lij_storage lij(
        .clk(clk),
        .rst(rst),
        .we(lij_we),
        .row_wr_addr(lij_row_wr_addr),
        .col_wr_addr(lij_col_wr_addr),
        .Lij_write_data(Lij_write_data),
        .re(lij_re),
        .row_rd_addr(lij_row_rd_addr),
        .col_rd_addr(lij_col_rd_addr),
        .Lij_read_data(Lij_read_data)
    );
    
    check_node_v2 cn(
        .clk(clk),
        .rst(rst),
        .start_Cn(start),
        .Cn_done(done),
        .lij_we(lij_we),
        .lij_row_wr_addr(lij_row_wr_addr),
        .lij_col_wr_addr(lij_col_wr_addr),
        .Lij_write_data(Lij_write_data)
    );
    
endmodule
