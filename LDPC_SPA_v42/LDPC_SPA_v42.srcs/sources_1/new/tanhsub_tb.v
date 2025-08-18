`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 22:45:12
// Design Name: 
// Module Name: tanhsub_tb
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


module tanhsub_tb(

    );
    
    reg signed [15:0] addr;
    wire [15:0] out;
    
    reg clk;
    reg [15:0] a_in=16'h3C00;
    reg [15:0] b_in=16'h3C00;
    wire [15:0] result_out;
    wire result_valid;
    reg [15:0] product = 16'h3C00;
    reg valid_in = 1'b0;
    reg rst=0;
    
    tanhsub_v2 utt(
        .in_data(addr),
        .tanh_out(out)
    );
    
    float_multiply uut(
        .clk(clk),
        .rst(rst),
        .a_in(a_in),
        .b_in(b_in),
        .valid_in(valid_in),
        .result_out(result_out),
        .result_valid(result_valid)
    );
    
    initial clk =0;
    always #2 clk = ~clk;
    
    initial begin
        for (addr = -15; addr < 15; addr= addr+1) begin
            //product = product * out;
            #2;
            
            a_in = product;
            b_in = out;
            valid_in = 1'b1;
            #5
            valid_in = 1'b0;
            wait(result_valid == 1);
            @(posedge  clk);
            product = result_out;
            
            //#2;
                       
        end
        @(posedge  clk);
        addr = 16'hC8C0;
        @(posedge clk);
        addr = 16'hC840;
        @(posedge clk);
        addr = 16'hC780;
        @(posedge clk);
        addr = 16'hC680;
        @(posedge clk);
        addr = 16'hC300;
        @(posedge clk);
        addr = 16'hBE00;
        @(posedge clk);
        addr = 16'hB800;
        @(posedge clk);
        addr = 16'h3800;
        @(posedge clk);
        addr = 16'hBF77;
        @(posedge clk);
        addr = 16'h3E00;
        @(posedge clk);
        addr = 16'h4100;
        @(posedge clk);
        addr = 16'h4480;
        @(posedge clk);
        addr = 16'h4680;
        @(posedge clk);
        addr = 16'h4780;
        @(posedge clk);
        addr = 16'h4840;
        
        $finish;
    end
    
endmodule
