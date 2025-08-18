`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kavin
// 
// Create Date: 02.07.2025 07:06:57
// Design Name: 
// Module Name: check_node_dummy
// Project Name: LDPC
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


module check_node_v2 #(
        parameter M = 1535,
        parameter N = 2559
    )(
        input wire clk,
        input wire rst,
        input wire start_Cn,
        output reg Cn_done,
        output reg lij_we,
        output reg [11:0] lij_row_wr_addr,
        output reg [2:0] lij_col_wr_addr,
        output reg [15:0] Lij_write_data,
        output reg lji_re,
        output reg [11:0] lji_col_rd_addr,
        output reg [2:0] lji_rowpos_rd_addr,
        input wire [15:0] Lji_read_data
                        
    );
    
    parameter IDLE           = 5'd0;
    parameter LOAD_CN        = 5'd1;
    parameter SET_J          = 5'd2;
    parameter GET_LJI        = 5'd3;
    parameter WAIT_TANH      = 5'd4;
    parameter INIT_PRODUCT   = 5'd5;
    parameter WAIT_PRODUCT   = 5'd6;
    parameter PRODUCT_OUT    = 5'd7;
    parameter COMPARE        = 5'd8;
    parameter CONVERT2FIXED  = 5'd9;
    parameter WAIT_FIXED     = 5'd10;
    parameter FIXED_OUTPUT   = 5'd11;
    parameter COMPUTE_ATANH  = 5'd12;
    parameter ATANH_WAIT     = 5'd13;
    parameter ATANH_OUT      = 5'd14;
    parameter CONVERT2FLOAT  = 5'd15;
    parameter WAIT_FLOAT     = 5'd16;
    parameter FLOAT_OUTPUT   = 5'd17;
    parameter FLOAT16_CONVERT= 5'd18;
    parameter WAIT_F32_F16   = 5'd19;
    parameter F16_OUTPUT     = 5'd20;
    parameter WRITE_LIJ      = 5'd21;
    parameter NEXT_J         = 5'd22;
    parameter NEXT_I         = 5'd23;
    parameter DONE           = 5'd24;
    
    reg [5:0] state;
    reg [5:0] next_state, prev_state;
    reg [11:0] row_i= 12'h000;
    reg [2:0] col_j=3'h0;
    reg [2:0] ele_k=3'h0;
    reg [11:0] data[5:0];
    reg [11:0] other_cn[4:0];
    //reg [12:0] index;
    reg [2:0] i,j,k,row_pos;
    wire [2:0]row_count;
    reg [11:0] row_count_addr=12'h000;
    reg [15:0] product_term=16'h3c00;
    reg [15:0] product_new=16'h3c00;
    wire [11:0] Hcol0, Hcol1, Hcol2, Hcol3, Hcol4, Hcol5;
    reg [2:0] a;
    wire  signed [15:0] llr_data;
    reg [11:0] llr_addr;
    reg signed [15:0] tanh_in;
    wire [15:0]tanh_out;
    wire [15:0] prod_out;
    wire valid_out_prod;
    reg [15:0] float_a, float_b = 16'h3c00;
    reg valid_in_prod=1'b0;
    reg start_Cn_d;
    reg valid_out_prod_n;
    wire ready_a_prod;
    wire ready_b_prod;
    wire start;
    wire rst_n = ~rst;
    reg atanh_valid_in;
    reg [31:0] atanh_data_in;
    wire atanh_valid_out;
    wire [15:0] atanh_data_out;
    reg valid_float_in;
    reg [15:0] float_in;
    wire valid_fixed_out;
    wire [15:0] fixed_out;
    reg valid_fixed_in;
    reg [15:0] fixed_in;
    wire valid_float_out;
    wire [31:0] float_out;
    reg [15:0] one_fixed = 16'h2000;
    reg [15:0] atanh_deg;
    reg [15:0] atanh_fixed;
    reg [31:0] atanh_float;
    reg valid_in_mul;
    wire valid_out_mul;
    wire [15:0] multi_out;
    reg [15:0] float_c;
    wire f32_ready;
    reg [31:0] f32_in;
    reg valid_f32_in;
    wire valid_f16_out;
    wire [15:0] f16_out;
    reg [15:0] atanh_float16;

    reg done = 1'b0;
    wire float_in_ready;
    wire atanh_in_ready;
    reg lij_we_n;
    reg [11:0] col_count_addr = 12'h000;
    wire [2:0] col_count;
    reg [11:0] Hcol_addr;
    wire [11:0] Hrow0, Hrow1, Hrow2, Hrow3, Hrow4, Hrow5;
    reg [11:0] Hrows [5:0];
    reg [11:0] col_data;
    wire start_Cn_rising = (~start_Cn_d && start_Cn); // rising edge
    wire valid_out_prod_rising = (~valid_out_prod_n && valid_out_prod);
    
    Hrow_count rowcount (
        .addr(row_count_addr),
        .Hr_count(row_count)
    );
    
    Hmat_row_pos Hrow(
        .Hrow_addr(row_i),
        .Hcol0(Hcol0),
        .Hcol1(Hcol1),
        .Hcol2(Hcol2),
        .Hcol3(Hcol3),
        .Hcol4(Hcol4),
        .Hcol5(Hcol5)
    );
    
    Hcol_count colcount(
        .addr(col_count_addr),
        .Hc_count(col_count)
    );
    
    Hmat_col_pos Hcol(
        .Hcol_addr(Hcol_addr),
        .Hrow0(Hrow0),
        .Hrow1(Hrow1),
        .Hrow2(Hrow2),
        .Hrow3(Hrow3),
        .Hrow4(Hrow4),
        .Hrow5(Hrow5)
    );
    
//    rx_data_gen rx_data(
//        .address(llr_addr),
//        .llr_data(llr_data)
//    );
    
    tanhsub_v2 tanh(
        .in_data(tanh_in),
        .tanh_out(tanh_out)
    );
    
    float_multiply product(
        .clk(clk),
        .rst(rst),
        .a_in(float_a), 
        .b_in(float_b),
        .valid_in(valid_in_prod),
        .result_out(prod_out),
        .result_valid(valid_out_prod),
        .ready_a(ready_a_prod),
        .ready_b(ready_b_prod)
    );
    
//    float_multiply multiply_2(
//        .clk(clk),
//        .rst(rst),
//        .a_in(float_c), 
//        .b_in(16'h4000),
//        .valid_in(valid_in_mul),
//        .result_out(multi_out),
//        .result_valid(valid_out_mul),        
//        .ready_a(ready_a_mul),
//        .ready_b(ready_b_mul)
//    );
    
    cordic_atanh_ip atanh(
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(atanh_valid_in),
        .in_data(atanh_data_in),
        .valid_out(atanh_valid_out),
        .out_data(atanh_data_out),
        .ready_in(atanh_in_ready)
    );

    float2fixed f2fix(
        .clk(clk),
        .valid_float(valid_float_in),
        .float_in(float_in),
        .fixed_valid(valid_fixed_out),
        .fixed_out(fixed_out),
        .ready(float_in_ready)
    );
    
    fixed_to_float f2float(
        .clk(clk),
        .valid_fixed(valid_fixed_in),
        .fixed_in(fixed_in),
        .float_valid(valid_float_out),
        .float_out(float_out),
        .ready(fixed_in_ready)
    );
    
    float32to16 f32tof16(
        .clk(clk),
        .valid_in(valid_f32_in),
        .float_in(f32_in),
        .float16_out(f16_out),
        .float_valid(valid_f16_out),
        .ready(f32_ready)
    );
    
    always @(*) begin
        row_count_addr = row_i;
        data[0] = Hcol0;
        data[1] = Hcol1;
        data[2] = Hcol2;
        data[3] = Hcol3;
        data[4] = Hcol4;
        data[5] = Hcol5;
        col_count_addr = col_data;
        Hcol_addr = col_data;
        Hrows[0] = Hrow0;
        Hrows[1] = Hrow1;
        Hrows[2] = Hrow2;
        Hrows[3] = Hrow3;
        Hrows[4] = Hrow4;
        Hrows[5] = Hrow5;
        
    end    
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
//            valid_in_prod <= 1'b0;
//            valid_float_in <= 1'b0;
//            atanh_valid_in <= 1'b0;
//            valid_fixed_in <= 1'b0;
//            valid_in_mul <= 1'b0;
            valid_out_prod_n <= 1'b0;
            start_Cn_d <= 1'b0;
            lij_we_n <= 1'b0;
        end else begin
//            valid_in_prod <= (state == PRODUCT_OUT && prev_state != PRODUCT_OUT);
//            valid_float_in <= (state == CONVERT2FIXED && prev_state != CONVERT2FIXED);
//            atanh_valid_in <= (state == COMPUTE_ATANH && prev_state != COMPUTE_ATANH);
//            valid_fixed_in <= (state == CONVERT2FLOAT && prev_state != CONVERT2FLOAT);
//            valid_in_mul <= (state == MULTIPLY2 && prev_state != MULTIPLY2);
            valid_out_prod_n <= valid_out_prod;
            start_Cn_d <= start_Cn;
            lij_we_n <= lij_we;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE;
            prev_state <= IDLE;
        end else begin
            state <= next_state;
            prev_state <= state;
        end
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            row_i <= 0;
            col_j <= 0;
            ele_k <= 0;
            Cn_done <= 0;
            lij_we <= 0;
            lji_re <= 0;
            valid_in_prod <= 1'b0;
            valid_float_in <= 1'b0;
            atanh_valid_in <= 1'b0;
            valid_fixed_in <= 1'b0;
            valid_f32_in <= 1'b0;
            for (i = 0; i <= 4; i = i + 1)
                other_cn[i] <= 12'd0;
        end
        else begin
            case(state) 
            
                IDLE: begin
                    if(start_Cn_rising) begin
                        next_state = LOAD_CN;
                    end else begin
                        next_state = IDLE;
                    end
                end             
                LOAD_CN: begin
                //connected_Vn = find(H(i, :));
                //other_Vn = connected_Vn(connected_Vn ~= j);
                //product_term = 1;
                    j=0;
                    for(i=0; i<row_count; i=i+1) begin
                        if(i != col_j) begin
                            other_cn[j] <= data[i];
                            j=j+1;
                        end
                    end 
                    product_term <= 16'h3C00;
                    next_state = SET_J;
                end
                SET_J: begin
                    col_data <= other_cn[ele_k];
                    lji_re <= 1;
                    next_state = GET_LJI;
                end
                GET_LJI: begin
                    for(k=0; k<col_count; k=k+1) begin
                        if(row_i == Hrows[k]) begin
                            lji_rowpos_rd_addr <= k;
                        end
                    end
                    lji_col_rd_addr <= other_cn[ele_k];
                    //lji_rowpos_rd_addr <= row_pos;
                    next_state = WAIT_TANH;
                end
                WAIT_TANH: begin
                    tanh_in <= Lji_read_data;
                    next_state = INIT_PRODUCT;
                end
                INIT_PRODUCT: begin
                    lji_re <= 0;
                    float_a <= product_term;
                    float_b <= tanh_out;
                    next_state = WAIT_PRODUCT;
                    valid_in_prod <= 1'b1;
                end
                WAIT_PRODUCT: begin
                    if(ready_a_prod & ready_b_prod) begin
                        valid_in_prod <= 1'b0;
                        next_state = PRODUCT_OUT;
                    end else 
                        next_state = WAIT_PRODUCT;
                end                
                PRODUCT_OUT: begin
                    if (valid_out_prod == 1) begin
                        product_term <= prod_out;

                        if (valid_out_prod_rising) begin
                            if(ele_k > row_count-3) begin
                                ele_k <= 0;
                                next_state = COMPARE;
                            end else begin
                                ele_k <= ele_k + 1;
                                next_state = SET_J;
                            end
                        end
                    end else begin
                        next_state = PRODUCT_OUT;
                    end
                end
                COMPARE: begin
                    if (product_term[14:0] >= 15'h3BFF) begin
                        product_new[14:0] <= 15'h3BFF;
                        product_new[15] <= product_term[15];
                    end else begin
                        product_new <= product_term;
                    end
                    next_state = CONVERT2FIXED;
                end
                CONVERT2FIXED: begin
                    float_in <= product_new;
                    valid_float_in <= 1'b1;
                    next_state = WAIT_FIXED;
                end
                WAIT_FIXED: begin
                    if(float_in_ready) begin
                        valid_float_in <= 1'b0;
                        next_state = FIXED_OUTPUT;
                    end else begin
                        next_state = WAIT_FIXED;
                    end
                end
                FIXED_OUTPUT: begin
                    if(valid_fixed_out ==1) begin
                        //atanh_deg <= fixed_out << 2;
                        atanh_deg <= fixed_out << 2;
                        next_state = COMPUTE_ATANH;
                    end else begin
                        next_state = FIXED_OUTPUT;
                    end
                end
                COMPUTE_ATANH: begin
                    atanh_data_in <= {atanh_deg, one_fixed};
                    atanh_valid_in <= 1'b1;
                    next_state = ATANH_WAIT;
                end
                ATANH_WAIT: begin 
                    if(atanh_in_ready) begin
                        atanh_valid_in <= 1'b0;
                        next_state = ATANH_OUT;
                    end else begin
                        next_state = ATANH_WAIT;
                    end
                end
                ATANH_OUT: begin
                    if(atanh_valid_out) begin
                        atanh_fixed <= atanh_data_out << 1;
                        next_state = CONVERT2FLOAT;
                    end else begin
                        next_state = ATANH_OUT;
                    end
                end
                CONVERT2FLOAT: begin
                    fixed_in <= atanh_fixed;
                    valid_fixed_in <= 1'b1;
                    next_state = WAIT_FLOAT;
                end
                WAIT_FLOAT: begin
                    if (fixed_in_ready) begin
                        valid_fixed_in <= 1'b0;
                        next_state = FLOAT_OUTPUT;
                    end else begin
                        next_state = WAIT_FLOAT;
                    end
                end
                FLOAT_OUTPUT: begin
                    if (valid_float_out) begin
                        atanh_float <= float_out;
                        next_state = FLOAT16_CONVERT;
                    end else begin
                        next_state = FLOAT_OUTPUT;
                    end
                end 
                FLOAT16_CONVERT: begin
                    f32_in <= atanh_float;
                    valid_f32_in <= 1'b1;
                    next_state = WAIT_F32_F16;
                end
                WAIT_F32_F16: begin
                    if(f32_ready) begin
                        valid_f32_in <= 1'b0;
                        next_state = F16_OUTPUT;
                    end else begin
                        next_state = WAIT_F32_F16;
                    end
                end
                F16_OUTPUT: begin
                    if(valid_f16_out) begin
                        atanh_float16 <= f16_out;
                        next_state = WRITE_LIJ;
                    end else begin
                        next_state = F16_OUTPUT;
                    end
                end
                WRITE_LIJ: begin
                    lij_row_wr_addr <= row_i;
                    lij_col_wr_addr <= col_j;
                    Lij_write_data <= atanh_float16;
                    lij_we <= 1;
                    next_state = NEXT_J;
                end
                NEXT_J: begin
                    lij_we <= 0;
                    if (prev_state != state) begin
                        if (col_j > row_count-2) begin
                           col_j <= 0;
                           next_state = NEXT_I;
                        end else begin
                            col_j <= col_j + 1;
                            next_state = LOAD_CN;
                        end
                     end
                end
                NEXT_I: begin
                    if (prev_state != state) begin
                        if (row_i < M) begin
                            row_i <= row_i + 1;
                            next_state = LOAD_CN;
                        end else begin
                            next_state = DONE;
                        end
                    end
                end
                DONE: Cn_done <= 1;
            endcase 
        end
        
    end
    
endmodule
