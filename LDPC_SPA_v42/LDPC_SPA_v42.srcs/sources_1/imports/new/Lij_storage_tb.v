`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2025 20:30:38
// Design Name: 
// Module Name: Lij_storage_tb
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


module Lij_storage_tb(

    );
    
    reg clk;
    reg rst;
    reg we;
    reg re;
    reg [11:0] row_wr;     // log2(NUM_ROWS) = 3 bits
    reg [2:0] col_wr;     // log2(NUM_COLS) = 4 bits
    reg [12:0] data_in;
    reg [11:0] row_rd;
    reg [2:0] col_rd;
    wire [12:0] data_out;
    
    Lij_storage memory_inst(
        .clk(clk),
        .rst(rst),
        .we(we),
        .row_wr_addr(row_wr),
        .col_wr_addr(col_wr),
        .Lij_write_data(data_in),
        .re(re),
        .row_rd_addr(row_rd),
        .col_rd_addr(col_rd),
        .Lij_read_data(data_out)
    );
    
        // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 100MHz clock
    
    initial begin
        $display("starting memmory test");
        rst = 1;
        we =0;
        re= 0;
        data_in = 0;
        row_wr =0;
        col_wr = 0;
        row_rd = 0;
        col_rd = 0;
        #10;
        rst = 0;
        //write memory to some location
        @(posedge clk);
        we = 1;
        row_wr = 12'd1; col_wr = 3'd2;
        data_in = 13'h00AA;
        @(posedge clk);
        row_wr = 12'd2; col_wr = 3'd3;
        data_in = 13'h00BB;
        @(posedge clk);
        row_wr = 12'd2; col_wr = 3'd4;
        data_in = 13'h00CC;
        @(posedge clk);
        row_wr = 12'd10; col_wr = 3'd1;
        data_in = 13'h00DD;
        @(posedge clk);
        we=0;
        
        //read data
        @(posedge clk);
        re=1;
        row_rd = 12'd1; col_rd = 3'd2;
        @(posedge clk);
        $display("read @[1][2] = %h", data_out);
        row_rd = 12'd2; col_rd = 3'd3;
        @(posedge clk);
        row_rd = 12'd2; col_rd = 3'd4;
        @(posedge clk);
        row_rd = 12'd10; col_rd = 3'd1;
        @(posedge clk);
        row_rd = 12'd9; col_rd = 3'd1;
        @(posedge clk);
        re =0;
        #10;
        $finish;
    end
    
endmodule
