`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2025 04:22:17
// Design Name: 
// Module Name: Lj_total
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


module Lj_total(
        input wire clk,
        input wire rst,
        input wire start_tot,
        output reg done_tot,
        output reg lij_re,
        output reg [11:0] lij_row_rd_addr,
        output reg [2:0] lij_col_rd_addr,
        input wire [15:0] Lij_read_data,
        output reg lj_tot_we,
        output reg [11:0] lj_tot_wr_addr,
        output reg [15:0] lj_tot_wr_data,
        output reg [11:0] llr_addr_tot,
        input wire [15:0] llr_data_tot
    );
    
    parameter IDLE           = 5'd0;
    parameter SET_I          = 5'd1;
    parameter GET_LIJ        = 5'd2;
    parameter UPDATE_LIJ     = 5'd3;
    parameter INIT_SUM       = 5'd4;
    parameter WAIT_SUM       = 5'd5;
    parameter SUM_OUT        = 5'd6;
    parameter GET_LJ_FLOAT   = 5'd7;
    parameter INIT_SUM2      = 5'd8;
    parameter WAIT_SUM2      = 5'd9;
    parameter SUM2_OUT       = 5'd10;
    parameter WRITE_LJ_TOT   = 5'd11;
    parameter NEXT_J         = 5'd12;
    parameter DONE           = 5'd13;
    parameter WAIT_ROWCOUNT  = 5'd14;
    parameter WAIT_COLCOUNT  = 5'd15;
    parameter WAIT_LIJ       = 5'd16;
    
    reg [5:0] state;
    reg [5:0] prev_state;
    reg [11:0] col_j= 12'h000;
    reg [11:0] row_count_addr=12'h000;
    reg [2:0] row_i=3'h0;
    reg [2:0] ele_k=3'h0;
    reg [11:0] data[5:0];
    reg [11:0] connected_cn[5:0];
    //reg [12:0] index;
    reg [2:0] i,j,k,row_pos;
    reg start_tot_d;
    wire start_tot_rising = (~start_tot_d && start_tot); // rising edge
    reg [15:0] lij_data;
    wire [15:0] add_out;
    wire [15:0] add_out2;
    reg [15:0] lj_total;
    wire valid_out_sum;
    wire valid_out_sum2;
    reg valid_out_sum_n;
    reg valid_out_sum2_n;
    reg [15:0] float_a, float_b = 16'h0000;
    reg [15:0] float_c, float_d = 16'h0000;
    reg valid_in_sum=1'b0;
    reg valid_in_sum2=1'b0;
    wire ready_a_sum;
    wire ready_b_sum;
    wire ready_c_sum;
    wire ready_d_sum;
    reg [15:0] sum_term;
    reg [11:0] col_count_addr;
    wire [2:0] col_count;
    wire [11:0] Hrow0, Hrow1, Hrow2, Hrow3, Hrow4, Hrow5;
    reg [11:0] Hrows [5:0];
    reg [11:0] Hcols[5:0];
    reg [11:0] row_data;
    wire [11:0] Hcol0, Hcol1, Hcol2, Hcol3, Hcol4, Hcol5;
    wire [2:0]row_count;
    reg [11:0] Hrow_addr;
    wire [71:0] hcol_data;
    wire [71:0] hrow_data;
    reg wait_colcounter;
    reg [1:0] wait_rowcounter;
    reg [2:0] wait_lijcounter;
    
//    Hrow_count rowcount_tot (
//        .addr(row_count_addr),
//        .Hr_count(row_count)
//    );
    hrow_count_mem rowcount_tot(
        .clka(clk),
        .addra(row_count_addr),
        .douta(row_count)
    );
    
//    Hmat_row_pos Hrow_tot(
//        .Hrow_addr(Hrow_addr),
//        .Hcol0(Hcol0),
//        .Hcol1(Hcol1),
//        .Hcol2(Hcol2),
//        .Hcol3(Hcol3),
//        .Hcol4(Hcol4),
//        .Hcol5(Hcol5)
//    );
    hrow_pos_mem Hrow_tot(
        .clka(clk),
        .addra(Hrow_addr),
        .douta(hcol_data)
    );
    
//    Hcol_count Col_count_tot (
//        .addr(col_count_addr),
//        .Hc_count(col_count)
//    );

    hcol_count_mem Col_count_tot(
        .clka(clk),
        .addra(col_count_addr),
        .douta(col_count)
    );
    
//    Hmat_col_pos Hcol_tot(
//        .Hcol_addr(col_j),
//        .Hrow0(Hrow0),
//        .Hrow1(Hrow1),
//        .Hrow2(Hrow2),
//        .Hrow3(Hrow3),
//        .Hrow4(Hrow4),
//        .Hrow5(Hrow5)
//    );
    hcol_pos_mem Hcol_tot (
        .clka(clk),
        .addra(col_j),
        .douta(hrow_data)
    );
    
    f_add add_tot(
        .clk(clk),
        .rst(rst),
        .a_in(float_a), 
        .b_in(float_b),
        .valid_in(valid_in_sum),
        .result_out(add_out),
        .result_valid(valid_out_sum),
        .ready_a(ready_a_sum),
        .ready_b(ready_b_sum)
    );
    
    f_add add2_tot(
        .clk(clk),
        .rst(rst),
        .a_in(float_c), 
        .b_in(float_d),
        .valid_in(valid_in_sum2),
        .result_out(add_out2),
        .result_valid(valid_out_sum2),
        .ready_a(ready_c_sum),
        .ready_b(ready_d_sum)
    );
    
    always @(*) begin
        col_count_addr = col_j;
        Hrows[0] = hrow_data[11:0];
        Hrows[1] = hrow_data[23:12];
        Hrows[2] = hrow_data[35:24];
        Hrows[3] = hrow_data[47:36];
        Hrows[4] = hrow_data[59:48];
        Hrows[5] = hrow_data[71:60];
        row_count_addr = row_data;
        Hrow_addr = row_data;
        Hcols[0] = hcol_data[11:0];
        Hcols[1] = hcol_data[23:12];
        Hcols[2] = hcol_data[35:24];
        Hcols[3] = hcol_data[47:36];
        Hcols[4] = hcol_data[59:48];
        Hcols[5] = hcol_data[71:60];
    end
    
   
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_out_sum_n <= 1'b0;
            start_tot_d <= 1'b0;
            state <= IDLE;
            prev_state <= IDLE;
            row_i <= 0;
            col_j <= 0;
            ele_k <= 0;
            done_tot <= 0;
            lij_re <= 0;
            lj_tot_we <= 0;
            valid_in_sum <= 1'b0;
            valid_in_sum2 <= 1'b0;
            wait_rowcounter <= 0;
            wait_colcounter <= 0;
            wait_lijcounter <= 0;
            sum_term <= 0;
            lij_data <= 0;
            for (i = 0; i <= 4; i = i + 1)
                connected_cn[i] <= 12'd0;
        end 
        else begin
            valid_out_sum_n <= valid_out_sum;
            start_tot_d <= start_tot;
            prev_state <= state;
            case(state) 
            
                IDLE: begin
                    row_i <= 0;
                    col_j <= 0;
                    ele_k <= 0;
                    done_tot <= 0;
                    lij_col_rd_addr <= 0;
                    lij_row_rd_addr <= 0;
                    sum_term <= 0;
                    lij_data <= 0;
                    if(start_tot_rising) begin
                        state <= SET_I;
                    end else begin
                        state <= IDLE;
                    end
                end             
                SET_I: begin //2
                    sum_term <= 16'h0000;
                    row_data <= Hrows[ele_k];
                    
                    state <= WAIT_ROWCOUNT;
                end
                WAIT_ROWCOUNT: begin
                    row_data <= Hrows[ele_k];
                    
                    if(wait_rowcounter == 2) begin
                        state <= GET_LIJ;
                        wait_rowcounter <= 0;
                    end else begin
                        state <= WAIT_ROWCOUNT;
                        wait_rowcounter <= wait_rowcounter+1;
                    end
                end
                GET_LIJ: begin //3
                    for(k=0; k<col_count; k=k+1) begin
                        if(col_j == Hcols[k]) begin
                            lij_col_rd_addr <= k;
                        end
                    end
                    lij_row_rd_addr <= Hrows[ele_k];
                    lij_re <= 1;
                    state <= WAIT_LIJ;
                end
                WAIT_LIJ: begin
                    if(wait_lijcounter == 2) begin
                        state <= UPDATE_LIJ;
                        wait_lijcounter <= 0;
                    end else begin
                        state <= WAIT_LIJ;
                        wait_lijcounter <= wait_lijcounter+1;
                    end
                end
                UPDATE_LIJ: begin  //4
                    lij_data <= Lij_read_data;
                    state <= INIT_SUM;
                end
                INIT_SUM: begin //5
                    lij_re <= 0;
                    float_a <= sum_term;
                    float_b <= lij_data;
                    state <= WAIT_SUM;
                    valid_in_sum <= 1'b1;
                end
                WAIT_SUM: begin //6
                    if(ready_a_sum & ready_b_sum) begin
                        valid_in_sum <= 1'b0;
                        state <= SUM_OUT;
                    end else
                        state <= WAIT_SUM;
                end
                SUM_OUT: begin //7
                    if(valid_out_sum == 1) begin
                        sum_term <= add_out;
                        if(~valid_out_sum_n & valid_out_sum) begin
                            if(ele_k >= col_count-1) begin
                                ele_k <= 0;
                                state <= GET_LJ_FLOAT;
                            end else begin
                                ele_k <= ele_k + 1;
                                state <= WAIT_ROWCOUNT;
                            end
                        end 
                    end else begin
                        state <= SUM_OUT;
                    end
                end
                GET_LJ_FLOAT: begin
                    llr_addr_tot <= col_j;
                    state <= INIT_SUM2;
                end
                INIT_SUM2: begin
                    float_c <= sum_term;
                    float_d <= llr_data_tot;
                    valid_in_sum2 <= 1'b1;
                    state <= WAIT_SUM2;
                end
                WAIT_SUM2: begin
                    if(ready_c_sum & ready_d_sum) begin
                        valid_in_sum2 <= 1'b0;
                        state <= SUM2_OUT;  
                    end else
                        state <= WAIT_SUM2;
                end
                SUM2_OUT: begin
                    if(valid_out_sum2 == 1) begin
                        lj_total <= add_out2;
                        state <= WRITE_LJ_TOT;
                    end else begin
                        state <= SUM2_OUT;
                    end
                end
                WRITE_LJ_TOT: begin
                    lj_tot_wr_addr <= col_j;
                    lj_tot_wr_data <= lj_total;
                    lj_tot_we <= 1;
                    state <= NEXT_J;
                end
                NEXT_J: begin 
                    lij_re <= 0;
                    if(prev_state != state) begin
                        if(col_j < 2559) begin
                            col_j <= col_j + 1;
                            state <= WAIT_COLCOUNT;
                        end else begin
                            col_j <= 0;
                            state <= DONE;
                        end
                    end
                end
                WAIT_COLCOUNT: begin
                    if(wait_colcounter == 1) begin
                        state <= SET_I;
                        wait_colcounter <= 0;
                    end else begin
                        state <= WAIT_COLCOUNT;
                        wait_colcounter <= 1;
                    end
                end
                DONE: begin
                    done_tot <= 1;
                    state <= IDLE;
                end 
            endcase
        end
   end 
        
    
endmodule
