`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.06.2025 05:40:10
// Design Name: 
// Module Name: check_node
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

//////////////////////////////////////////////////////////////////////////////////
//    %Step 2: Update CN messages Lij for each CN
//        % Lij = 2*tanh^-1(Product of all nodes except current j th node of(tanh(0.5*Lji))) 
//        for i = 1:m
//            Cn = find(H(i, :));
//            for j = Cn 
//                other_Vn = Cn(Cn ~= j);
//                product_term = 1;
//                for k = other_Vn
//                    product_term = product_term * (tanh(0.5* Lji(i,k)));
//                end
//                product_term2 = min(max(product_term, -0.999999), 0.999999);
//                Lij(i,j) = 2* atanh(product_term2);
//                product_term2 =1; 
//            end
//        end
//////////////////////////////////////////////////////////////////////////////////

module check_node #(
        parameter M = 1535,
        parameter N = 2559
    )(
        input wire clk,
        input wire rst,
        input wire start_Cn,
        output reg Cn_done
                        
    );
    
    parameter IDLE           = 4'd0;
    parameter LOAD_CN        = 4'd1;
    parameter SET_J          = 4'd2;
    parameter WAIT_TANH      = 4'd3;
    parameter INIT_PRODUCT   = 4'd4;
    parameter COMPARE        = 4'd5;
    parameter CONVERT2FIXED  = 4'd6;
    parameter COMPUTE_ATANH  = 4'd7;
    parameter CONVERT2FLOAT  = 4'd8;
    parameter MULTIPLY2      = 4'd9;
    parameter WRITE_LIJ      = 4'd10;
    parameter NEXT_IJ        = 4'd11;
    parameter DONE           = 4'd12;
    
    reg [3:0] state;
    reg [3:0] next_state, prev_state;
    reg [11:0] row_i= 12'h000;
    reg [2:0] col_j=3'h0;
    reg [2:0] ele_k=3'h0;
    reg [11:0] data[5:0];
    reg [11:0] other_cn[4:0];
    //reg [12:0] index;
    integer i,j;
    wire [2:0]row_count;
    reg [11:0] row_count_addr;
    reg [15:0] product_term;
    reg [15:0] product_new;
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
    wire [15:0] float_out;
    reg [15:0] one_fixed = 16'h2000;
    reg [15:0] atanh_deg;
    reg [15:0] atanh_fixed;
    reg [15:0] atanh_float;
    reg valid_in_mul;
    wire valid_out_mul;
    wire [15:0] multi_out;
    reg [15:0] float_c;
    reg lij_we;
    reg [11:0] lij_row_wr_addr;
    reg [2:0] lij_col_wr_addr;
    reg [12:0] Lij_write_data;
    reg [11:0] lij_row_rd_addr;
    reg [2:0] lij_col_rd_addr;
    reg lij_re;
    wire [12:0] Lij_read_data;
    reg done = 1'b0;
    
    Hrow_count count (
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
    
    rx_data_gen rx_data(
        .address(llr_addr),
        .llr_data(llr_data)
    );
    
    tanhsub tanh(
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
        .result_valid(valid_out_prod)
    );
    
    float_multiply multiply_2(
        .clk(clk),
        .rst(rst),
        .a_in(float_c), 
        .b_in(16'h4000),
        .valid_in(valid_in_mul),
        .result_out(multi_out),
        .result_valid(valid_out_mul)
    );
    
    cordic_atanh_ip atanh(
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(atanh_valid_in),
        .in_data(atanh_data_in),
        .valid_out(atanh_valid_out),
        .out_data(atanh_data_out)
    );

    float2fixed f2fix(
        .clk(clk),
        .valid_float(valid_float_in),
        .float_in(float_in),
        .fixed_valid(valid_fixed_out),
        .fixed_out(fixed_out)
    );
    
    fixed_to_float f2float(
        .clk(clk),
        .valid_fixed(valid_fixed_in),
        .fixed_in(fixed_in),
        .float_valid(valid_float_out),
        .float_out(float_out)
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
            
    always @(*) begin
        row_count_addr = row_i;
        data[0] = Hcol0;
        data[1] = Hcol1;
        data[2] = Hcol2;
        data[3] = Hcol3;
        data[4] = Hcol4;
        data[5] = Hcol5;
        
    end    
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            valid_in_prod <= 1'b0;
            valid_float_in <= 1'b0;
            atanh_valid_in <= 1'b0;
            valid_fixed_in <= 1'b0;
            valid_in_mul <= 1'b0;
        end else begin
            valid_in_prod <= (state == INIT_PRODUCT && prev_state != INIT_PRODUCT);
            valid_float_in <= (state == CONVERT2FIXED && prev_state != CONVERT2FIXED);
            atanh_valid_in <= (state == COMPUTE_ATANH && prev_state != COMPUTE_ATANH);
            valid_fixed_in <= (state == CONVERT2FLOAT && prev_state != CONVERT2FLOAT);
            valid_in_mul <= (state == MULTIPLY2 && prev_state != MULTIPLY2);
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
            row_i <= 12'h000;
            col_j <= 3'h0;
            ele_k <= 3'h0;
        end
        else begin
            case(state) 
            
                IDLE: begin
                    next_state = start_Cn ? LOAD_CN : IDLE;
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
                    llr_addr = other_cn[ele_k];
                    tanh_in = llr_data;
                    next_state = WAIT_TANH;
                end
                WAIT_TANH: begin
                    float_a = product_term;
                    float_b = tanh_out;
                    next_state = INIT_PRODUCT;
                end
                INIT_PRODUCT: begin
                    if (valid_out_prod == 1) begin
                        product_term <= prod_out;
                        ele_k <= ele_k + 1;
                        next_state = (ele_k <= row_count-1) ? SET_J : COMPARE;
                    end else begin
                        next_state = INIT_PRODUCT;
                    end
                    
                end
                COMPARE: begin
                    if (product_term[14:0] >= 15'h3BFF) begin
                        product_new[14:0] = 15'h3BFF;
                        product_new[15] = product_term[15];
                    end else begin
                        product_new = product_term;
                    end
                    next_state = CONVERT2FIXED;
                end
                CONVERT2FIXED: begin
                    float_in = product_new;
                    if(valid_fixed_out ==1) begin
                        atanh_deg = fixed_out << 2;
                        next_state = COMPUTE_ATANH;
                    end
                end                
                COMPUTE_ATANH: begin
                    atanh_data_in = {atanh_deg, one_fixed};
                    if(valid_float_out == 1) begin
                        atanh_fixed = atanh_data_out;
                        next_state = CONVERT2FLOAT;
                    end
                end
                CONVERT2FLOAT: begin
                    fixed_in = atanh_fixed;
                    if(valid_float_out == 1) begin
                        atanh_float = float_out;
                        next_state = MULTIPLY2;
                    end
                end
                MULTIPLY2: begin
                    float_c = atanh_float;
                    if(valid_out_mul == 1) begin
                        lij_we = 1;
                        lij_row_wr_addr = row_i;
                        lij_col_wr_addr = col_j;
                        Lij_write_data = multi_out;
                        next_state = WRITE_LIJ;
                    end 
                end
                WRITE_LIJ: begin
                    lij_we = 0;
                    next_state = NEXT_IJ;
                end 
                NEXT_IJ: begin
                    if (col_j < row_count) begin
                       col_j <=  col_j + 1;
                       next_state = LOAD_CN;
                    end else if ((col_j >= row_count) && (row_i < M)) begin
                        row_i <= row_i + 1;
                        col_j <= 0;
                        next_state = LOAD_CN;
                    end else if (row_i >= M) begin
                        next_state = DONE;
                    end
                end
                DONE: begin
                    Cn_done = 1;
                    next_state = IDLE;
                end 
                //default: next_state = next_state;
            endcase 
        end
        
    end
    
endmodule
