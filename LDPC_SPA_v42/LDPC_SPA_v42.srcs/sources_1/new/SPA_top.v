`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:41:14 PM
// Design Name: 
// Module Name: SPA_top
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


module SPA_top(input wire btn,
               input wire clk,
               output wire led0_b,
               output wire led1_g,
               output wire led0_r 
               );
               
               
    reg boot=0;
    (* keep = "true" *) reg  [10:0] row = 0;
    reg  [11:0] col = 0;
    wire        bit;
    
    integer clock_counter;
    reg Hclock;
    reg out;
    wire [12:0] addr;
    wire [15:0] llr_data;
    
    
    assign led0_r = ^row ^ ^col ^ out ^ boot ^ llr_data ;
    
    H_mat_bits #(.M(512)) Hmat (
        .row(row),
        .col(col),
        .H_bit(bit)
    );
    
    rx_data_gen rx_data1(
        .address(addr),
        .llr_data(llr_data)
    );
    
//    always @(posedge clk) begin
//        clock_counter <= clock_counter + 1;
//        if (clock_counter == 1) begin
//           Hclock <= ~Hclock; 
//           clock_counter <= 0;
//        end
//    end
    
    assign addr = col;
    always @(posedge clk) begin
        
        if(boot ==0 && btn == 0) begin
            if (col == 12'd2559) begin
                if (row == 11'd1535) begin
                    // Both row and col have reached their maximum values
                    // You might want to add logic here to stop or reset
                    row <= 11'd1535;
                    col <= 12'd2559;
                    
                    boot <= 1;
                end else begin
                    row <= row + 1'b1;
                    col <= 12'd0;
                    
                end
            end else begin
                col <= col + 1'b1;
            end

        end
        if(bit == 1) begin
            
        end
        out <= bit;
            
    
    end
       
       
    ila_0 ila (.clk(clk), .probe0(boot), .probe1(out), .probe2(row), .probe3(col), .probe4(Hclock));
    
    
    led_control(.btn(btn), .boot(boot), .led0_b(led0_b), .led1_g(led1_g));
    
    
  
    
    
    
        //module to convert received dat into LLR values
    //input receiveed data and snr
    // noise variance calculation
//    EbN0 = 10^(snr_i / 10);  % Convert to linear scale
//    sigma2 = 1 / (2 * EbN0);  % Noise variance
 
    
//    %apply llr to received data
//    % LLR = 2*yi/noisevariance
//    Lj_float = (((2 * (receivedData_dac3)') / sigma2));
//    Lj_fixed = round(Lj_float); %round(Lj_float*32); % Lj_float;

    
endmodule

