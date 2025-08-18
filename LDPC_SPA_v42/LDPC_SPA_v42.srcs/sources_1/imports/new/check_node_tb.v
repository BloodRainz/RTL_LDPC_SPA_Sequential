`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.07.2025 04:22:52
// Design Name: 
// Module Name: check_node_tb
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


module check_node_tb(

    );
    
    reg clk= 0;
    reg rst;
    wire done;
    reg start;
    reg start_vn;
    
    wire lij_we;
    wire [11:0] lij_row_wr_addr;
    wire [2:0] lij_col_wr_addr;
    wire [15:0] Lij_write_data;
    wire [11:0] lij_row_rd_addr;
    wire [2:0] lij_col_rd_addr;
    wire lij_re;
    wire [15:0] Lij_read_data;
    wire [11:0] lij_row_rd_addr_v;
    wire [2:0] lij_col_rd_addr_v;
    wire lij_re_v;
    wire [15:0] lij_read_data_v;
    reg [11:0] i;
    reg [2:0] j;
    
    wire lji_we;
    wire [11:0] lji_col_wr_addr;
    wire [2:0] lji_rowpos_wr_addr;
    wire [15:0] lji_write_data;
    wire [11:0] lji_col_rd_addr;
    wire [2:0] lji_rowpos_rd_addr;
    wire lji_re;
    wire [15:0] lji_read_data;
    wire lji_init_done;
    wire [11:0] llr_addr;
    wire [15:0] llr_data;
    wire [11:0] llr_addr_lji;
    wire [15:0] llr_data_lji;
    reg switch= 1;
    reg switch_tot=0;
    reg [11:0] other_addr=0;
    reg [15:0] other_data = 0;
    wire done_vn;
    wire [11:0] llr_addr_v;
    wire [15:0] llr_data_v;
    reg start_tot =0;
    wire done_tot;
    wire lij_re_tot;
    wire [11:0] lij_row_rd_addr_tot;
    wire [2:0] lij_col_rd_addr_tot;
    wire [15:0] lij_read_data_tot;
    wire lj_tot_we;
    wire [11:0] lj_tot_wr_addr;
    wire [15:0] lj_tot_wr_data;
    wire [11:0] llr_addr_tot;
    wire [15:0] llr_data_tot;
    reg lj_tot_re;
    reg [11:0] lj_tot_rd_addr;
    wire [15:0] lj_tot_rd_data;
    integer file,out_file;
    reg decoded_out [2559:0];
    
    
    always #5 clk = ~clk;
    
//    check_node cn(
//        .clk(clk),
//        .rst(rst),
//        .start_Cn(start),
//        .Cn_done(done)
//    );

    llr_float_data rx_data_initial(
        .address(llr_addr),
        .llr_fdata(llr_data)
    );
    
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
    
    Lji_storage lji(
        .clk(clk),
        .rst(rst),
        //write ports
        .we(lji_we), //write enable
        .col_wr_addr(lji_col_wr_addr),
        .rowpos_wr_addr(lji_rowpos_wr_addr),
        .Lji_write_data(lji_write_data),
        //read ports
        .re(lji_re),
        .col_rd_addr(lji_col_rd_addr),
        .rowpos_rd_addr(lji_rowpos_rd_addr),
        .Lji_read_data(lji_read_data),
        .init_done(lji_init_done),
        .llr_addr(llr_addr_lji),
        .llr_data(llr_data_lji)
    );
    
    check_node_v3 cn(
        .clk(clk),
        .rst(rst),
        .start_Cn(start),
        .Cn_done(done),
        .lij_we(lij_we),
        .lij_row_wr_addr(lij_row_wr_addr),
        .lij_col_wr_addr(lij_col_wr_addr),
        .Lij_write_data(Lij_write_data),
        .lji_re(lji_re),
        .lji_col_rd_addr(lji_col_rd_addr),
        .lji_rowpos_rd_addr(lji_rowpos_rd_addr),
        .Lji_read_data(lji_read_data)
    );
    
    variable_node vn(
        .clk(clk),
        .rst(rst),
        .start_Vn(start_vn),
        .Vn_done(done_vn),
        .lij_re(lij_re_v),
        .lij_row_rd_addr(lij_row_rd_addr_v),
        .lij_col_rd_addr(lij_col_rd_addr_v),
        .Lij_read_data(lij_read_data_v),
        .lji_we(lji_we),
        .lji_col_wr_addr(lji_col_wr_addr),
        .lji_rowpos_wr_addr(lji_rowpos_wr_addr),
        .Lji_write_data(Lji_write_data),
        .llr_addr_v(llr_addr_v),
        .llr_data_v(llr_data_v)
    );
    
    Lj_total lj_tot(
        .clk(clk),
        .rst(rst),
        .start_tot(start_tot),
        .done_tot(done_tot),
        .lij_re(lij_re_tot),
        .lij_row_rd_addr(lij_row_rd_addr_tot),
        .lij_col_rd_addr(lij_col_rd_addr_tot),
        .Lij_read_data(lij_read_data_tot),
        .lj_tot_we(lj_tot_we),
        .lj_tot_wr_addr(lj_tot_wr_addr),
        .lj_tot_wr_data(lj_tot_wr_data),
        .llr_addr_tot(llr_addr_tot),
        .llr_data_tot(llr_data_tot)
    );
    
    Lj_tot_storage Lj_tot_store(
        .clk(clk),
        .rst(rst),
        .we(lj_tot_we),
        .wr_addr(lj_tot_wr_addr),
        .wr_data(lj_tot_wr_data),
        .re(lj_tot_re),
        .rd_addr(lj_tot_rd_addr),
        .rd_data(lj_tot_rd_data)
    );
    
    assign llr_addr = switch ? llr_addr_lji : (switch_tot ? llr_addr_tot : llr_addr_v);
    assign llr_data_lji = switch ? llr_data : other_data;
    assign llr_data_v = switch ? other_data : llr_data;
    assign llr_data_tot = switch_tot ? llr_data : other_data;
    assign lij_re = switch_tot ? lij_re_tot : lij_re_v;
    assign lij_row_rd_addr = switch_tot ? lij_row_rd_addr_tot : lij_row_rd_addr_v;
    assign lij_col_rd_addr = switch_tot ? lij_col_rd_addr_tot : lij_col_rd_addr_v;
    assign lij_read_data_tot = switch_tot ? Lij_read_data : other_data;
    assign lij_read_data_v = switch_tot ? other_data : Lij_read_data;
    
    initial begin
        file = $fopen("Lj_total.txt", "w"); // "w" means write mode; use "a" for append
        out_file = $fopen("decoded.txt", "w");
        if (file == 0) begin
            $display("Failed to open file!");
            $finish;
        end
        rst = 1;
        start = 0;
        switch = 1;
        start_vn = 0;
        start_tot =0;
        #10;
        rst = 0;
        #5;
        wait(lji_init_done);
        @(posedge clk);
        start = 1;
        @(posedge clk);
        @(posedge clk);
        start = 0;
        wait(done == 1);
        
        #10;
        @(posedge clk);
        switch = 0;
        @(posedge clk);
        start_vn = 1;
        @(posedge clk);
        @(posedge clk);
        start_vn = 0;
        wait(done_vn == 1);
        #10;
        
        $display("Lji mat check");
        
        #10;
        @(posedge clk);
        start_tot = 1;
        switch_tot = 1;
        @(posedge clk);
        @(posedge clk);
        start_tot = 0;
        wait(done_tot == 1);
        #10;       
        
        @(posedge clk);
        lj_tot_re = 1;
        for (i = 0; i<1024; i=i+1) begin
            @(posedge clk);
            lj_tot_rd_addr = i;
            @(posedge clk);
            @(posedge clk);
            if(lj_tot_rd_data[15] == 1)
                decoded_out[i] = 1'b1;
            else
                decoded_out[i] = 1'b0;
            $fdisplay(file, "Lj_total[%h]:= %h", lj_tot_rd_addr, lj_tot_rd_data);
            $fdisplay(out_file, "decoded[%d]:= %h", i, decoded_out[i]);
        end
        @(posedge clk);
        lj_tot_re = 0;
        $fclose(file);
//        lij_re=1;
//        lij_row_rd_addr = 12'd1; lij_col_rd_addr = 3'd2;
//        @(posedge clk);
//        $display("read @[1][2] = %h", Lij_read_data);
//        for (i= 1024; i<1535; i=i+1) begin
//            for (j= 0; j<6; j=j+1) begin
//                @(posedge clk);
//                lij_row_rd_addr = i; lij_col_rd_addr = j;
//            end
//        end
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd0;
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd1;
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd2;
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd3;
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd4;
//        @(posedge clk);
//        lij_row_rd_addr = 12'd1024; lij_col_rd_addr = 3'd5;
//        @(posedge clk);
//        lij_re =0;
        #10;
        $finish;
    end
    
endmodule
