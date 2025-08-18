`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2025 09:50:23
// Design Name: 
// Module Name: SPA_top_TB
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


module SPA_top_TB(

    );
    
    reg clk= 0;
    reg start_btn;
    reg rst_btn;
    wire led0_b;
    wire led1_g;
    wire led0_r;
    integer out_file, decoded_itr1, decoded_itr2, decoded_itr3, decoded_itr4;
    integer decoded_itr5, decoded_itr6, decoded_itr7, decoded_itr8, decoded_itr9, decoded_itr10;
    integer decoded_itr11, decoded_itr12, decoded_itr13, decoded_itr14, decoded_itr15;
    integer decoded_itr16, decoded_itr17, decoded_itr18, decoded_itr19, decoded_itr20;
    integer decoded_itr21, decoded_itr22, decoded_itr23, decoded_itr24, decoded_itr25;
    integer lij_itr1, lij_itr2, lij_itr3, lij_itr4, lij_itr5, lij_itr6, lij_itr7, lij_itr8, lij_itr9, lij_itr10;
    integer all_data, lji_itr1, lji_itr2, lji_itr3, lji_itr4, lji_itr5, lji_itr6, lji_itr7, lji_itr8, lji_itr9, lji_itr10;
    wire [4:0] itr;
    wire [11:0] out_addr;
    wire out_data;
    wire out_ready;
    wire [11:0] llr_addr;
    wire [17:0] llr_addr_full;
    wire [15:0] llr_data;
    reg debug;
    reg debug_lij_re;
    wire [95:0] debug_lij_data;
    reg [11:0] debug_lij_row_addr;
    reg debug_lji_re;
    reg [11:0] debug_lji_col_addr;
    wire [95:0] debug_lji_data;
    wire [15:0] llr_data_spa;
    reg data_ready;
    reg [11:0] i;
    reg [7:0] vec=1;
    parameter NUM_VECTORS = 17;
    parameter VECTOR_SIZE = 2048;
    
    SPA_top_v3 SPA(
        .clk(clk),
        .start_btn(start_btn),
        .rst_btn(rst_btn),
        .led0_b(led0_b),
        .led1_g(led1_g),
        .led0_r(led0_r),
        .itr(itr),
        .llr_addr(llr_addr),
        .llr_data(llr_data_spa),
        .out_addr(out_addr),
        .out_data(out_data),
        .out_ready(out_ready),
        .debug(debug), 
        .debug_lij_re(debug_lij_re),
        .debug_lij_data(debug_lij_data),
        .debug_lij_row_addr(debug_lij_row_addr),
        .debug_lji_re(debug_lji_re), 
        .debug_lji_col_addr(debug_lji_col_addr),
        .debug_lji_data(debug_lji_data)
    );
    
    llr_float_snr2 rx_data_initial(
//    llr_float_snr5 rx_data_initial(
//    llr_float_full_snr3 rx_data_initial(
//    llr_float_full_snr6 rx_data_initial(
//    llr_float_data_snr3 rx_data_initial(
//    llr_float_data rx_data_initial(
        .address((vec * VECTOR_SIZE)+llr_addr),
        .llr_fdata(llr_data)
    );
    
    assign llr_data_spa = (llr_addr > 12'd2047) ? 16'h0000 : llr_data;
    
    always #5 clk = ~clk;
    
//    always @(posedge clk) begin
//        if (rst) begin
//            data_in <= 0;
//        end else begin
//      // Calculate offset for current vector
//            integer base_idx = vec * VECTOR_SIZE;
//            data_in <= mem[base_idx + addr_out];
//        end
//    end
//    always @(posedge clk) begin
//        if (done) begin
//            if (vec < NUM_VECTORS - 1) begin
//                vec <= vec + 1;
//                $display("Moving to vector %0d", vec + 1);
//            end else begin
//                $display("All vectors processed");
//                $finish;
//            end
//        end
//    end
    
    always @(posedge clk) begin
        if(itr==0 && out_ready)
            $fdisplay(decoded_itr1, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==1 && out_ready)
            $fdisplay(decoded_itr2, "decoded[%d]:= %h", out_addr, out_data);
        
        if(itr==2 && out_ready)
            $fdisplay(decoded_itr3, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==3 && out_ready)
            $fdisplay(decoded_itr4, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==4 && out_ready)
            $fdisplay(decoded_itr5, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==5 && out_ready)
            $fdisplay(decoded_itr6, "decoded[%d]:= %h", out_addr, out_data);
            //$fdisplay(all_data, "%h", out_data);
        if(itr==6 && out_ready) begin
            $fdisplay(decoded_itr7, "decoded[%d]:= %h", out_addr, out_data);
            
        end
        if(itr==7 && out_ready)
            $fdisplay(decoded_itr8, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==8 && out_ready)
            $fdisplay(decoded_itr9, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==9 && out_ready)
            $fdisplay(decoded_itr10, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==10 && out_ready)
            $fdisplay(decoded_itr11, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==11 && out_ready)
            $fdisplay(decoded_itr12, "decoded[%d]:= %h", out_addr, out_data);
        
        if(itr==12 && out_ready)
            $fdisplay(decoded_itr13, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==13 && out_ready)
            $fdisplay(decoded_itr14, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==14 && out_ready)
            $fdisplay(decoded_itr15, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==15 && out_ready)
            $fdisplay(decoded_itr16, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==16 && out_ready)
            $fdisplay(decoded_itr17, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==17 && out_ready)
            $fdisplay(decoded_itr18, "decoded[%d]:= %h", out_addr, out_data);
        
        if(itr==18 && out_ready)
            $fdisplay(decoded_itr19, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==19 && out_ready)
            $fdisplay(decoded_itr20, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==20 && out_ready)
            $fdisplay(decoded_itr21, "decoded[%d]:= %h", out_addr, out_data);  
        if(itr==21 && out_ready)
            $fdisplay(decoded_itr22, "decoded[%d]:= %h", out_addr, out_data);
        
        if(itr==22 && out_ready)
            $fdisplay(decoded_itr23, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==23 && out_ready)
            $fdisplay(decoded_itr24, "decoded[%d]:= %h", out_addr, out_data);
        if(itr==24 && out_ready)
            $fdisplay(decoded_itr25, "decoded[%d]:= %h", out_addr, out_data);
            
        if(debug == 1 && itr==1) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr1, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr1, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end      
        if(debug == 1 && itr==2) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr2, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr2, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end
        if(debug == 1 && itr==3) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr3, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr3, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end
        if(debug == 1 && itr==4) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr4, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr4, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end      
        if(debug == 1 && itr==5) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr5, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr5, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end
        if(debug == 1 && itr==6) begin
            if(debug_lij_re && data_ready)
                $fdisplay(lij_itr6, "lij[%d]:= %h, %h, %h, %h, %h, %h", debug_lij_row_addr, debug_lij_data[15:0], debug_lij_data[31:16], debug_lij_data[47:32], debug_lij_data[63:48], debug_lij_data[79:64], debug_lij_data[95:80]);
            if(debug_lji_re && data_ready)
                $fdisplay(lji_itr6, "lji[%d]:= %h, %h, %h, %h, %h, %h", debug_lji_col_addr, debug_lji_data[15:0], debug_lji_data[31:16], debug_lji_data[47:32], debug_lji_data[63:48], debug_lji_data[79:64], debug_lji_data[95:80]);
        end 
               
    end
    
    initial begin
        //out_file = $fopen("decoded_top.txt", "w");
        all_data = $fopen("decodedfull_data_snr6.txt","w");
        while (vec < NUM_VECTORS - 1) begin
            decoded_itr1 = $fopen("decoded_itr1.txt", "w");
            decoded_itr2 = $fopen("decoded_itr2.txt", "w");
            decoded_itr3 = $fopen("decoded_itr3.txt", "w");
            decoded_itr4 = $fopen("decoded_itr4.txt", "w");
            
            lij_itr1 = $fopen("lij_itr1.txt", "w");
            lji_itr1 = $fopen("lji_itr1.txt", "w");
            lij_itr2 = $fopen("lij_itr2.txt", "w");
            lji_itr2 = $fopen("lji_itr2.txt", "w");
            lij_itr3 = $fopen("lij_itr3.txt", "w");
            lji_itr3 = $fopen("lji_itr3.txt", "w");
            lij_itr4 = $fopen("lij_itr4.txt", "w");
            lji_itr4 = $fopen("lji_itr4.txt", "w");
            lij_itr5 = $fopen("lij_itr5.txt", "w");
            lji_itr5 = $fopen("lji_itr5.txt", "w");
            lij_itr6 = $fopen("lij_itr6.txt", "w");
            lji_itr6 = $fopen("lji_itr6.txt", "w");
            debug = 0;
            @(posedge clk);
            rst_btn = 1;
            data_ready = 0;
            @(posedge clk);
            rst_btn = 0;
            @(posedge clk);
            start_btn = 1;
            @(posedge clk);
            start_btn = 0;
            @(posedge clk);
            wait(itr == 0);
            
    
    
            wait(itr == 1);
            $fclose(decoded_itr1);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr1);
            $fclose(lji_itr1);
            wait(itr == 2);
            $fclose(decoded_itr2);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr2);
            $fclose(lji_itr2);
            
            wait(itr == 3);
            $fclose(decoded_itr3);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr3);
            $fclose(lji_itr3);
            decoded_itr5 = $fopen("decoded_itr5.txt", "w");
            wait(itr == 4);
            $fclose(decoded_itr4);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr4);
            $fclose(lji_itr4);
            decoded_itr6 = $fopen("decoded_itr6.txt", "w");
            decoded_itr7 = $fopen("decoded_itr7.txt", "w");
            decoded_itr8 = $fopen("decoded_itr8.txt", "w");
            decoded_itr9 = $fopen("decoded_itr9.txt", "w");
            decoded_itr10 = $fopen("decoded_itr10.txt", "w");
    
            wait(itr == 5);
            $fclose(decoded_itr5);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr5);
            $fclose(lji_itr5);
            
            wait(itr == 6);
            $fclose(decoded_itr6);
            debug = 1;
            @(posedge clk);
            for (i=0; i<1536; i=i+1) begin 
                debug_lij_re = 1;
                debug_lij_row_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lij_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            for (i=0; i<2560; i=i+1) begin 
                debug_lji_re = 1;
                debug_lji_col_addr = i;
                @(posedge clk);
                @(posedge clk);
                @(posedge clk);
                data_ready = 1;
                @(posedge clk);
                data_ready = 0;
                debug_lji_re = 0;
                @(posedge clk);
            end
            @(posedge clk);
            @(posedge clk);
            debug = 0;
            @(posedge clk);
            $fclose(lij_itr6);
            $fclose(lji_itr6);
            @(posedge clk);
            wait(itr == 7);
            $fclose(decoded_itr7);
            wait(itr == 8);
            $fclose(decoded_itr8);
            wait(itr == 9);
            $fclose(decoded_itr9);
            wait(itr == 10);
            $fclose(decoded_itr10);
            decoded_itr11 = $fopen("decoded_itr11.txt", "w");
            decoded_itr12 = $fopen("decoded_itr12.txt", "w");
            decoded_itr13 = $fopen("decoded_itr13.txt", "w");
            decoded_itr14 = $fopen("decoded_itr14.txt", "w");
            decoded_itr15 = $fopen("decoded_itr15.txt", "w");
            wait(itr == 11);
            $fclose(decoded_itr11);
            wait(itr == 12);
            $fclose(decoded_itr12);
            wait(itr == 13);
            $fclose(decoded_itr13);
            wait(itr == 14);
            $fclose(decoded_itr14);

            vec = vec+1;
            $display("Moving to vector %0d", vec + 1);
            @(posedge clk);
        end
        #100;
        $fclose(all_data);
        $display("All vectors processed");
        $finish;
        
//        debug = 1;
//        @(posedge clk);
//        for (i=0; i<1536; i=i+1) begin 
//            debug_lij_re = 1;
//            debug_lij_row_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lij_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        for (i=0; i<2560; i=i+1) begin 
//            debug_lji_re = 1;
//            debug_lji_col_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lji_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        @(posedge clk);
//        debug = 0;
//        @(posedge clk);
//        $fclose(lij_itr7);
//        $fclose(lji_itr7);
        
//        wait(itr == 8);
//        $fclose(decoded_itr8);
//        debug = 1;
//        @(posedge clk);
//        for (i=0; i<1536; i=i+1) begin 
//            debug_lij_re = 1;
//            debug_lij_row_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lij_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        for (i=0; i<2560; i=i+1) begin 
//            debug_lji_re = 1;
//            debug_lji_col_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lji_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        @(posedge clk);
//        debug = 0;
//        @(posedge clk);
//        $fclose(lij_itr8);
//        $fclose(lji_itr8);
        
//        wait(itr == 9);
//        $fclose(decoded_itr9);
//        debug = 1;
//        @(posedge clk);
//        for (i=0; i<1536; i=i+1) begin 
//            debug_lij_re = 1;
//            debug_lij_row_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lij_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        for (i=0; i<2560; i=i+1) begin 
//            debug_lji_re = 1;
//            debug_lji_col_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lji_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        @(posedge clk);
//        debug = 0;
//        @(posedge clk);
//        $fclose(lij_itr9);
//        $fclose(lji_itr9);
        
//        decoded_itr11 = $fopen("decoded_itr11.txt", "w");
//        decoded_itr12 = $fopen("decoded_itr12.txt", "w");
//        decoded_itr13 = $fopen("decoded_itr13.txt", "w");
//        decoded_itr14 = $fopen("decoded_itr14.txt", "w");
//        decoded_itr15 = $fopen("decoded_itr15.txt", "w");
        
//        wait(itr == 10);
//        $fclose(decoded_itr10);
//        debug = 1;
//        @(posedge clk);
//        for (i=0; i<1536; i=i+1) begin 
//            debug_lij_re = 1;
//            debug_lij_row_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lij_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        for (i=0; i<2560; i=i+1) begin 
//            debug_lji_re = 1;
//            debug_lji_col_addr = i;
//            @(posedge clk);
//            @(posedge clk);
//            @(posedge clk);
//            data_ready = 1;
//            @(posedge clk);
//            data_ready = 0;
//            debug_lji_re = 0;
//            @(posedge clk);
//        end
//        @(posedge clk);
//        @(posedge clk);
//        debug = 0;
//        @(posedge clk);
//        $fclose(lij_itr10);
//        $fclose(lji_itr10);
        
//        wait(itr == 11);
//        wait(itr == 12);
//        wait(itr == 13);
//        wait(itr == 14);
//        wait(itr == 15);
//        decoded_itr16 = $fopen("decoded_itr16.txt", "w");
//        decoded_itr17 = $fopen("decoded_itr17.txt", "w");
//        decoded_itr18 = $fopen("decoded_itr18.txt", "w");
//        decoded_itr19 = $fopen("decoded_itr19.txt", "w");
//        decoded_itr20 = $fopen("decoded_itr20.txt", "w");
//        wait(itr == 16);
//        wait(itr == 17);
//        wait(itr == 18);
//        wait(itr == 19);
//        wait(itr == 20);
//        decoded_itr21 = $fopen("decoded_itr21.txt", "w");
//        decoded_itr22 = $fopen("decoded_itr22.txt", "w");
//        decoded_itr23 = $fopen("decoded_itr23.txt", "w");
//        decoded_itr24 = $fopen("decoded_itr24.txt", "w");
//        decoded_itr25 = $fopen("decoded_itr25.txt", "w");
//        wait(itr == 21);
//        wait(itr == 22);
//        wait(itr == 23);
//        wait(itr == 24);
//        wait(itr == 25);

//        wait(led1_g);
//        for (i = 0; i<1024; i=i+1) begin
//            @(posedge clk);
//            $fdisplay(out_file, "decoded[%d]:= %h", i, led0_r);
//            @(posedge clk);
//        end
//        wait(led0_r);
//        #1000;
        //$finish;
    end
    
endmodule
