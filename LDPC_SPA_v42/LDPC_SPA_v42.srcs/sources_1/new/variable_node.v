`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2025 17:11:57
// Design Name: 
// Module Name: variable_node
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


module variable_node #(
        parameter M = 1535,
        parameter N = 2559
    )(
        input wire clk,
        input wire rst,
        input wire start_Vn,
        output reg Vn_done,
        output reg lij_re,
        output reg [11:0] lij_row_rd_addr,
        output reg [2:0] lij_col_rd_addr,
        input wire [15:0] Lij_read_data,
        output reg lji_we,
        output reg [11:0] lji_col_wr_addr,
        output reg [2:0] lji_rowpos_wr_addr,
        output reg [15:0] Lji_write_data,
        output reg [11:0] llr_addr_v,
        input wire [15:0] llr_data_v
                        
    );
    
    parameter IDLE           = 5'd0;
    parameter LOAD_VN        = 5'd1;
    parameter SET_I          = 5'd2;
    parameter GET_LIJ        = 5'd3;
    parameter UPDATE_LIJ     = 5'd4;
    parameter INIT_SUM       = 5'd5;
    parameter WAIT_SUM       = 5'd6;
    parameter SUM_OUT        = 5'd7;
    parameter GET_LJ_FLOAT   = 5'd8;
    parameter INIT_SUM2      = 5'd9;
    parameter WAIT_SUM2      = 5'd10;
    parameter SUM2_OUT       = 5'd11;
    parameter WRITE_LJI      = 5'd12;
    parameter NEXT_I         = 5'd13;
    parameter NEXT_J         = 5'd14;
    parameter DONE           = 5'd15;
    parameter WAIT_WRITE     = 5'd16;
    parameter WAIT_ROWCOUNT  = 5'd17;
    parameter WAIT_COLCOUNT  = 5'd18;
    parameter WAIT_LIJ       = 5'd19;
    
    reg [5:0] state;
    reg [5:0] next_state, prev_state;
    reg [11:0] col_count_addr;
    wire [2:0] col_count;
    wire [11:0] Hrow0, Hrow1, Hrow2, Hrow3, Hrow4, Hrow5;
    reg [11:0] Hrows [5:0];
    reg [11:0] other_vn[4:0];
    reg [11:0] col_j= 12'h000;
    reg [2:0] row_i=3'h0;
    reg [2:0] ele_k=3'h0;
    reg start_Vn_d;
    reg [2:0] i,j,k;
    reg [15:0] sum_term=16'h0000;
    reg [11:0] Hcols[5:0];
    reg [11:0] row_data;
    wire [11:0] Hcol0, Hcol1, Hcol2, Hcol3, Hcol4, Hcol5;
    reg [11:0] row_count_addr=12'h000;
    wire [2:0]row_count;
    reg [11:0] Hrow_addr;
    reg [15:0] lij_data;
    wire [15:0] add_out;
    wire [15:0] add_out2;
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
    reg start_Vn_n;
    reg [15:0] lji_data;
    wire start_vn_rising = ~start_Vn_n & start_Vn;
    wire [71:0] hcol_data;
    wire [71:0] hrow_data;
    reg wait_rowcounter;
    reg wait_colcounter;
    reg [2:0] wait_lijcounter;
    
//    Hcol_count Col_countv (
//        .addr(col_count_addr),
//        .Hc_count(col_count)
//    );

    hcol_count_mem Col_countv(
        .clka(clk),
        .addra(col_count_addr),
        .douta(col_count)
    );
    
//    Hmat_col_pos Hcolv(
//        .Hcol_addr(col_j),
//        .Hrow0(Hrow0),
//        .Hrow1(Hrow1),
//        .Hrow2(Hrow2),
//        .Hrow3(Hrow3),
//        .Hrow4(Hrow4),
//        .Hrow5(Hrow5)
//    );
    hcol_pos_mem Hcolv (
        .clka(clk),
        .addra(col_j),
        .douta(hrow_data)
    );
    
//    Hrow_count rowcountv (
//        .addr(row_count_addr),
//        .Hr_count(row_count)
//    );
    hrow_count_mem rowcountv(
        .clka(clk),
        .addra(row_count_addr),
        .douta(row_count)
    );

    
//    Hmat_row_pos Hrowv(
//        .Hrow_addr(Hrow_addr),
//        .Hcol0(Hcol0),
//        .Hcol1(Hcol1),
//        .Hcol2(Hcol2),
//        .Hcol3(Hcol3),
//        .Hcol4(Hcol4),
//        .Hcol5(Hcol5)
//    );

    hrow_pos_mem Hrowv(
        .clka(clk),
        .addra(Hrow_addr),
        .douta(hcol_data)
    );
    
    f_add add(
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
    
    f_add add2(
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
            state <= IDLE;
            prev_state <= IDLE;
            valid_out_sum_n <= 1'b0;
            start_Vn_n <= 1'b0;
            row_i <= 0;
            col_j <= 0;
            ele_k <= 0;
            Vn_done <= 0;
            lij_re <= 0;
            lji_we <= 0;
            valid_in_sum <= 1'b0;
            valid_in_sum2 <= 1'b0;
            wait_rowcounter <= 0;
            wait_colcounter <= 0;
            wait_lijcounter <= 0;
            sum_term <= 0;
            lij_data <= 0;
            for (i = 0; i <= 4; i = i + 1)
                other_vn[i] <= 12'd0;
        end
        else begin
            prev_state <= state;
            valid_out_sum_n <= valid_out_sum;
            start_Vn_n <= start_Vn;
            case(state)
                IDLE: begin
                    row_i <= 0;
                    col_j <= 0;
                    ele_k <= 0;
                    Vn_done <= 0;
                    lij_col_rd_addr <= 0;
                    lij_row_rd_addr <= 0;
                    wait_lijcounter <= 0;
                    sum_term <= 0;
                    lij_data <= 0;
                    if(start_vn_rising) begin
                        state <= LOAD_VN;
                    end else begin
                        state <= IDLE;
                    end
                end
                LOAD_VN: begin
                    j=0;
                    if(col_count > 1) begin
                        for (i=0; i<col_count; i=i+1) begin
                            if(i != row_i) begin
                                other_vn[j] <= Hrows[i];
                                j=j+1;
                            end
                        end
                        state <= SET_I;
                    end else begin
                        state <= GET_LJ_FLOAT;
                    end
                    sum_term <= 0;
                end
                SET_I: begin //2
                    row_data <= other_vn[ele_k];
                    state <= WAIT_ROWCOUNT;
                end
                WAIT_ROWCOUNT: begin
                    if(wait_rowcounter == 1) begin
                        state <= GET_LIJ;
                        wait_rowcounter <= 0;
                    end else begin
                        state <= WAIT_ROWCOUNT;
                        wait_rowcounter <= 1;
                    end
                end
                GET_LIJ: begin //3
                    for(k=0; k<row_count; k=k+1) begin
                        if(col_j == Hcols[k]) begin
                            lij_col_rd_addr <= k;
                        end
                    end
                    lij_row_rd_addr <= other_vn[ele_k];
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
                            if(ele_k >= col_count-2) begin
                                ele_k <= 0;
                                state <= GET_LJ_FLOAT;
                            end else begin
                                ele_k <= ele_k + 1;
                                state <= SET_I;
                            end
                        end 
                    end else begin
                        state <= SUM_OUT;
                    end
                end
                GET_LJ_FLOAT: begin
                    llr_addr_v <= col_j;
                    state <= INIT_SUM2;
                end
                INIT_SUM2: begin
                    float_c <= sum_term;
                    float_d <= llr_data_v;
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
                        lji_data <= add_out2;
                        state <= WRITE_LJI;
                    end else begin
                        state <= SUM2_OUT;
                    end
                end
                WRITE_LJI: begin
                    sum_term <= 0;
                    lji_col_wr_addr <= col_j;
                    lji_rowpos_wr_addr <= row_i;
                    Lji_write_data <= lji_data;
                    lji_we <= 1;
                    state <= WAIT_WRITE;
                end
                WAIT_WRITE: begin
                    lji_we <= 0;
                    state <= NEXT_I;
                end
                NEXT_I: begin
                    lji_we <= 0;
                    if(prev_state != state) begin
                        if(row_i >= col_count-1) begin
                            row_i <= 0;
                            state <= NEXT_J;
                        end else begin
                            row_i <= row_i + 1;
                            state <= LOAD_VN;
                        end
                    end
                end
                NEXT_J: begin 
                    if(prev_state != state) begin
                        if(col_j < N) begin
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
                        state <= LOAD_VN;
                        wait_colcounter <= 0;
                    end else begin
                        state <= WAIT_COLCOUNT;
                        wait_colcounter <= 1;
                    end
                end
                DONE: begin
                    Vn_done <= 1;
                    state <= IDLE;
                end
            endcase 
        end
    end
    
endmodule
