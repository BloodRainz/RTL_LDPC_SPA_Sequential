`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2025 05:29:38
// Design Name: 
// Module Name: SPA_top_v3
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


module SPA_top_v3(
        input wire start_btn,
        input wire rst_btn,
        input wire clk,
        output wire led0_b,
        output wire led1_g,
        output reg led0_r,
        output wire [11:0] llr_addr,
        input wire [15:0] llr_data,
        output reg [4:0] itr,
        output reg [11:0] out_addr,
        output reg out_data,
        output reg out_ready,
        input wire debug,
        input wire debug_lij_re,
        output reg [95:0] debug_lij_data,
        input wire [11:0] debug_lij_row_addr,
        input wire debug_lji_re,
        input wire [11:0] debug_lji_col_addr,
        output reg [95:0] debug_lji_data
    );
    
//    reg out_ready;
//    reg [3:0] itr;
//    reg [11:0] out_addr;
//    reg out_data;
//    wire [11:0] llr_addr;
//    wire [15:0] llr_data;
    
    parameter IDLE           = 5'd0;
    parameter UPDATE_LJI     = 5'd1;
    parameter CHECK_NODE     = 5'd2;
    parameter WAIT_CN        = 5'd3;   
    parameter VARIABLE_NODE  = 5'd4;
    parameter WAIT_VN        = 5'd5;
    parameter LJ_TOTAL       = 5'd6;
    parameter WAIT_LJ_T      = 5'd7;
    parameter READ_LJ_TOT    = 5'd8;
    parameter DECODED_OUT    = 5'd9;
    parameter NEXT_LJ_TOT    = 5'd10;
    parameter NEXT_ITERATION = 5'd11;
    parameter DONE           = 5'd12;
    parameter SEND_OUTPUT    = 5'd13;
    parameter WAIT           = 5'd14;
    parameter DEBUGER          = 5'd15;
    
    reg boot;
    reg rst;
    wire done_cn;
    reg start_cn;
    reg start_vn;
    
    wire lij_we;
    wire [11:0] lij_row_wr_addr;
    wire [2:0] lij_col_wr_addr;
    wire [15:0] Lij_write_data;
    wire [11:0] lij_row_rd_addr;
    wire [2:0] lij_col_rd_addr;
    wire lij_re;
    reg [15:0] Lij_read_data;
    wire [11:0] lij_row_rd_addr_v;
    wire [2:0] lij_col_rd_addr_v;
    wire lij_re_v;
    wire [15:0] lij_read_data_v;
    reg [11:0] i;
    reg [11:0] j;
    
    wire lji_we;
    wire lji_we_v;
    reg lji_we_ini;
    wire [11:0] lji_col_wr_addr;
    wire [2:0] lji_rowpos_wr_addr;
    wire [15:0] lji_write_data;
    wire [11:0] lji_col_rd_addr;
    wire [2:0] lji_rowpos_rd_addr;
    wire [11:0] lji_col_wr_addr_v;
    wire [2:0] lji_rowpos_wr_addr_v;
    wire [15:0] lji_write_data_v;
    reg [11:0] lji_col_wr_addr_ini;
    reg [2:0] lji_rowpos_wr_addr_ini;
    reg [15:0] lji_write_data_ini;
    wire lji_re;
    reg [15:0] lji_read_data;
    wire lji_init_done;
    reg [11:0] llr_addr_lji;
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
    reg [5:0] state, saved_state;
    reg [5:0] prev_state;
    reg start_btn_n;
    wire start_btn_falling = start_btn_n & ~start_btn;
    reg lij_rst, lji_rst, cn_rst, vn_rst, lj_tot_rst, lj_tot_st_rst = 0;
    reg [4:0] max_itr = 5'd15;
    reg cn_done_latch;
    reg vn_done_latch;
    reg tot_done_latch;
    //reg [3:0] itr = 0;
    reg [95:0] lij_comb_wr_data;
    wire [95:0] lij_comb_rd_data;
    wire [95:0] lji_comb_wr_data;
    reg [95:0] lji_comb_wr_data_v;
    wire [95:0] lji_comb_rd_data;
    reg [11:0] init_i;
    reg [2:0]  init_j;
    //reg init_done;
    reg init_active;
    reg init_done = 0;  
    reg [95:0] lji_wr_buf;  
    wire lji_re_c;
    wire [11:0] lji_col_rd_addr_c;
    reg debug_n;
    wire debug_rising = ~debug_n & debug;
    
    led_control led (.btn(start_btn), .boot(boot), .led0_b(led0_b), .led1_g(led1_g));
    
//    blk_mem_gen_0 rx_data(
//        .clka(clk),
//        .addra(llr_addr),
//        .douta(llr_data)
//    );

//    llr_float_data_snr3 rx_data_initial(
//        .address(llr_addr),
//        .llr_fdata(llr_data)
//    );
    
//    Lij_storage lij(
//        .clk(clk),
//        .rst(lij_rst),
//        .we(lij_we),
//        .row_wr_addr(lij_row_wr_addr),
//        .col_wr_addr(lij_col_wr_addr),
//        .Lij_write_data(Lij_write_data),
//        .re(lij_re),
//        .row_rd_addr(lij_row_rd_addr),
//        .col_rd_addr(lij_col_rd_addr),
//        .Lij_read_data(Lij_read_data)
//    );

    lij_mem_bram lij_storage(
        .clka(clk),
        .ena(1'b1),
        .wea(lij_we),
        .addra(lij_row_wr_addr),
        .dina(lij_comb_wr_data),
        .enb(lij_re),
        .clkb(clk),
        .addrb(lij_row_rd_addr),
        .doutb(lij_comb_rd_data)
    );
    
    Lji_mem_bram lji_storage(
        .clka(clk),
        .ena(1'b1),
        .wea(lji_we),
        .addra(lji_col_wr_addr),
        .dina(lji_comb_wr_data),
        .enb(lji_re),
        .clkb(clk),
        .addrb(lji_col_rd_addr),
        .doutb(lji_comb_rd_data)
    );
    
//    Lji_storage lji(
//        .clk(clk),
//        .rst(lji_rst),
//        //write ports
//        .we(lji_we), //write enable
//        .col_wr_addr(lji_col_wr_addr),
//        .rowpos_wr_addr(lji_rowpos_wr_addr),
//        .Lji_write_data(lji_write_data),
//        //read ports
//        .re(lji_re),
//        .col_rd_addr(lji_col_rd_addr),
//        .rowpos_rd_addr(lji_rowpos_rd_addr),
//        .Lji_read_data(lji_read_data),
//        .init_done(lji_init_done),
//        .llr_addr(llr_addr_lji),
//        .llr_data(llr_data_lji)
//    );
    
    check_node_v3 cn(
        .clk(clk),
        .rst(cn_rst),
        .start_Cn(start_cn),
        .Cn_done(done_cn),
        .lij_we(lij_we),
        .lij_row_wr_addr(lij_row_wr_addr),
        .lij_col_wr_addr(lij_col_wr_addr),
        .Lij_write_data(Lij_write_data),
        .lji_re(lji_re_c),
        .lji_col_rd_addr(lji_col_rd_addr_c),
        .lji_rowpos_rd_addr(lji_rowpos_rd_addr),
        .Lji_read_data(lji_read_data)
    );
    
    variable_node vn(
        .clk(clk),
        .rst(vn_rst),
        .start_Vn(start_vn),
        .Vn_done(done_vn),
        .lij_re(lij_re_v),
        .lij_row_rd_addr(lij_row_rd_addr_v),
        .lij_col_rd_addr(lij_col_rd_addr_v),
        .Lij_read_data(lij_read_data_v),
        .lji_we(lji_we_v),
        .lji_col_wr_addr(lji_col_wr_addr_v),
        .lji_rowpos_wr_addr(lji_rowpos_wr_addr_v),
        .Lji_write_data(lji_write_data),
        .llr_addr_v(llr_addr_v),
        .llr_data_v(llr_data_v)
    );
    
    Lj_total lj_tot(
        .clk(clk),
        .rst(lj_tot_rst),
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
        .rst(lj_tot_st_rst),
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
    assign lij_re = debug ? debug_lij_re : (switch_tot ? lij_re_tot : lij_re_v);
    assign lji_re = debug ? debug_lji_re : lji_re_c;
    assign lji_col_rd_addr = debug ? debug_lji_col_addr : lji_col_rd_addr_c;
    assign lij_row_rd_addr = debug ? debug_lij_row_addr : (switch_tot ? lij_row_rd_addr_tot : lij_row_rd_addr_v);
    assign lij_col_rd_addr = switch_tot ? lij_col_rd_addr_tot : lij_col_rd_addr_v;
    assign lij_read_data_tot = switch_tot ? Lij_read_data : other_data;
    assign lij_read_data_v = switch_tot ? other_data : Lij_read_data;
    //assign lji_rowpos_wr_addr = init_done ? lji_rowpos_wr_addr_v : lji_rowpos_wr_addr_ini;
    assign lji_col_wr_addr = init_done ? lji_col_wr_addr_v : lji_col_wr_addr_ini;
    assign lji_comb_wr_data = init_done ? lji_comb_wr_data_v : lji_wr_buf;
    assign lji_we = init_done ? lji_we_v : lji_we_ini;
    
    always @(*) begin
        if(done_cn == 1) 
            cn_done_latch = 1;
        else if (state == WAIT_VN)
            cn_done_latch = 0;
        
        if(done_vn == 1) 
            vn_done_latch = 1;
        else if (state == WAIT_LJ_T)
            vn_done_latch = 0;
            
        if(done_tot == 1)
            tot_done_latch = 1;
        else if (state == WAIT)
            tot_done_latch = 0;
    end
    
    always @(*) begin
        
        if (lij_we == 1) begin
            if(lij_col_wr_addr==0) 
                lij_comb_wr_data[15:0]= Lij_write_data;
            if(lij_col_wr_addr==1)
                lij_comb_wr_data[31:16]= Lij_write_data;
            if(lij_col_wr_addr==2)
                lij_comb_wr_data[47:32]= Lij_write_data;
            if(lij_col_wr_addr==3)
                lij_comb_wr_data[63:48]= Lij_write_data;
            if(lij_col_wr_addr==4)
                lij_comb_wr_data[79:64]= Lij_write_data;
            if(lij_col_wr_addr==5)   
                lij_comb_wr_data[95:80]= Lij_write_data;  
        end
        if (lij_re == 1) begin
            if(debug)
                debug_lij_data = lij_comb_rd_data;
            else begin
                if(lij_col_rd_addr==0)
                    Lij_read_data = lij_comb_rd_data[15:0];
                if(lij_col_rd_addr==1)
                    Lij_read_data = lij_comb_rd_data[31:16];
                if(lij_col_rd_addr==2)
                    Lij_read_data = lij_comb_rd_data[47:32];
                if(lij_col_rd_addr==3)
                    Lij_read_data = lij_comb_rd_data[63:48];
                if(lij_col_rd_addr==4)
                    Lij_read_data = lij_comb_rd_data[79:64];
                if(lij_col_rd_addr==5)
                    Lij_read_data = lij_comb_rd_data[95:80];
            end
        end
        if (lji_we == 1) begin
            if(lji_rowpos_wr_addr_v==0) 
                lji_comb_wr_data_v[15:0]= lji_write_data;
            if(lji_rowpos_wr_addr_v==1)
                lji_comb_wr_data_v[31:16]= lji_write_data;
            if(lji_rowpos_wr_addr_v==2)
                lji_comb_wr_data_v[47:32]= lji_write_data;
            if(lji_rowpos_wr_addr_v==3)
                lji_comb_wr_data_v[63:48]= lji_write_data;
            if(lji_rowpos_wr_addr_v==4)
                lji_comb_wr_data_v[79:64]= lji_write_data;
            if(lji_rowpos_wr_addr_v==5)   
                lji_comb_wr_data_v[95:80]= lji_write_data;  
        end
        if (lji_re == 1) begin
            if(debug)
                debug_lji_data = lji_comb_rd_data;
            else begin
                if(lji_rowpos_rd_addr==0)
                    lji_read_data = lji_comb_rd_data[15:0];
                if(lji_rowpos_rd_addr==1)
                    lji_read_data = lji_comb_rd_data[31:16];
                if(lji_rowpos_rd_addr==2)
                    lji_read_data = lji_comb_rd_data[47:32];
                if(lji_rowpos_rd_addr==3)
                    lji_read_data = lji_comb_rd_data[63:48];
                if(lji_rowpos_rd_addr==4)
                    lji_read_data = lji_comb_rd_data[79:64];
                if(lji_rowpos_rd_addr==5)
                    lji_read_data = lji_comb_rd_data[95:80];
            end
        end
            
    end
    
    always @(posedge clk or posedge rst_btn) begin
        debug_n <= debug;
        if (rst_btn) begin
            init_active <= 1;
            init_i <= 0;
            init_j <= 0;
            llr_addr_lji <= 0;
            init_done <= 0;
            lji_rowpos_wr_addr_ini <= 0;
            lji_col_wr_addr_ini <= 0;
            lji_write_data_ini <=0;
            lji_we_ini <= 0;
        end else if (init_active) begin
            // Assign to memory from llr_data (assume 1-cycle delay is acceptable)
            lji_we_ini <= 0;
            lji_wr_buf[16*init_j +: 16] <= llr_data_lji;
//            lji_rowpos_wr_addr_ini <= init_j;
            lji_col_wr_addr_ini <= init_i;
            // Step to next column
            if (init_j < 5) begin
                
                init_j <= init_j + 1;
            end else begin
                init_j <= 0;
                init_i <= init_i + 1;
                lji_we_ini <= 1;
                llr_addr_lji <= init_i + 1;
                
            end
    
            // Stop when all are done
            if (init_i == 2559 && init_j == 5) begin
                init_active <= 0;
                init_done <= 1;
                lji_we_ini <= 0;
            end
        end
    end
    
    
    always @(posedge clk or posedge rst_btn) begin
        if(rst_btn) begin
            lij_rst <= 1;
            lji_rst <= 1;
            cn_rst <= 1;
            vn_rst <= 1;
            lj_tot_rst <= 1;
            lj_tot_st_rst <= 1;
            start_cn <= 0;
            switch <= 1;
            start_vn <= 0;
            start_tot <=0;
            itr <= 0;
            state <= IDLE;
            prev_state <= IDLE;
            start_btn_n <= 1'b0;
            //debug_n <= 0;
        end else if (debug_rising == 1) begin
            saved_state <= state; 
            
            state <= DEBUGER;  
        end else begin
            lij_rst <= 0;
            lji_rst <= 0;
            cn_rst <= 0;
            vn_rst <= 0;
            lj_tot_rst <= 0;
            lj_tot_st_rst <= 0;
            prev_state <= state;
            start_btn_n <= start_btn;
            //debug_n <= debug;
            case(state)
                IDLE: begin
                    lij_rst <= 0;
                    lji_rst <= 0;
                    cn_rst <= 0;
                    vn_rst <= 0;
                    lj_tot_rst <= 0;
                    lj_tot_st_rst <= 0;
                    if(start_btn_falling) 
                        state <= UPDATE_LJI;
                     else
                        state <= IDLE;
                end
                DEBUGER: begin
                    if(debug == 0)
                        state <= saved_state;
                    else
                        state <= DEBUGER;
                end
                UPDATE_LJI: begin
                    cn_rst <= 0;
                    vn_rst <= 0;
                    lj_tot_rst <= 0;
                    if(init_done) 
                        state <= CHECK_NODE;
                    else 
                        state <= UPDATE_LJI;
                end
                CHECK_NODE: begin
                    start_cn <= 1;
                    state <= WAIT_CN;
                end
                WAIT_CN: begin
                    start_cn <= 0;
                    if(cn_done_latch) begin
                        state <= VARIABLE_NODE;
                        switch <= 0;
                    end else
                        state <= WAIT_CN;                        
                end
                VARIABLE_NODE: begin
                    start_vn <= 1;
                    state <= WAIT_VN;
                end                
                WAIT_VN: begin
                    start_vn <= 0;
                    if(vn_done_latch) begin
                        state <= LJ_TOTAL;
                        switch_tot <= 1;
                    end else
                        state <= WAIT_VN;                    
                end
                LJ_TOTAL: begin
                    start_tot <= 1;
                    state <= WAIT_LJ_T;
                end
                WAIT_LJ_T: begin
                    start_tot <= 0;
                    if(tot_done_latch) begin
                        switch_tot <= 0;
                        i<= 0;
                        state <= READ_LJ_TOT;
                    end else
                        state <= WAIT_LJ_T;
                end
                READ_LJ_TOT: begin
                    out_ready = 0;
                    lj_tot_re <= 1;
                    lj_tot_rd_addr <= i;
                    state <= WAIT;
                end
                WAIT:begin
                    state <= DECODED_OUT;
                end                
                DECODED_OUT: begin
                    state <= NEXT_LJ_TOT;
                    out_addr = i;
                    out_ready = 1;
//                    decoded_out[i] <= lj_tot_rd_data[15];
//                    out_data = lj_tot_rd_data[15];
                    if(lj_tot_rd_data[15] == 1) begin
                        if(lj_tot_rd_data[14:0] != 14'h0000) begin
                            decoded_out[i] <= 1'b1;
                            out_data = 1;
                        end else begin
                            decoded_out[i] <= 1'b0;
                            out_data = 0;
                        end                        
                    end
                    else begin
                        decoded_out[i] <= 1'b0;
                        out_data = 0;
                    end
                end
                NEXT_LJ_TOT: begin
                    //out_ready <= 1;
                    out_ready = 0;
                    //out_data <= decoded_out[i];
                    if(prev_state != state) begin
                        if(i > 2559) begin
                            i <= 0;
                            lj_tot_re <= 0;
                            state <= NEXT_ITERATION;
                        end else begin
                            i <= i+1;
                            state <= READ_LJ_TOT;
                        end
                    end
                end
                NEXT_ITERATION: begin
                    out_ready <= 0;
//                    cn_rst <= 1;
//                    vn_rst <= 1;
//                    lj_tot_rst <= 1;
                    j<= 0;
                    if(prev_state != state) begin
                        if(itr > max_itr-2) begin
                            itr <=0;
                            state <= DONE;
                        end else begin
                            itr <= itr + 1;
                            state <= CHECK_NODE;
                        end
                    end
                end
                DONE: begin
                    boot <= 1;
                    state <= SEND_OUTPUT;
                    
                end
                SEND_OUTPUT: begin
                    if(prev_state != state) begin
                        if(j > 1024) begin
                            j <=0;
                            state <= IDLE;
                            led0_r <= 1;
                        end else begin
                            j <= j + 1;
                            state <= DONE;
                            led0_r <= decoded_out[j];
                        end
                    end
                    
                end
            endcase                
        end
    end
    
endmodule
