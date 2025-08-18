`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2025 14:23:15
// Design Name: 
// Module Name: cordic_atanh_tb
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


module cordic_atanh_tb(

    );
    
    reg         clk = 0;
    reg         rst_n = 0;
    reg         valid_in = 0;
    reg         valid_fixed = 0;
    reg         valid_f32_in = 0;
    
    //wire        ready_in;
    reg  [31:0] in_data;
    wire        valid_out;
    wire        valid_float;
    wire        valid_f16_out;
    wire [15:0] out_data;
    wire [31:0] out_float;
    wire [15:0] x_fixed = 16'h2000; // 0.998
    wire [15:0] y_fixed = 16'hE999; // 0.740
    reg [15:0] fixed_in;
    reg [31:0] float32_in;
    wire [15:0] float16_out;
    wire ready_in;
    

    // Clock generation
    always #5 clk = ~clk;

    // Instantiate top wrapper
    cordic_atanh_ip uut (
        .clk(clk),
        .rst_n(rst_n),
        .valid_in(valid_in),
        .in_data(in_data),
        .valid_out(valid_out),
        .out_data(out_data),
        .ready_in(ready_in)
    );
    
    fixed_to_float uuut(
        .clk(clk),
        .valid_fixed(valid_fixed),
        .fixed_in(fixed_in),
        .float_out(out_float),
        .float_valid(valid_float)
    );
    
    float32to16 uuuut(
        .clk(clk),
        .valid_in(valid_f32_in),
        .float_in(float32_in),
        .float16_out(float16_out),
        .float_valid(valid_f16_out)
    );

    initial begin
        $display("Starting test...");
        
        // Reset
        rst_n = 0;
        #20;
        rst_n = 1;
        #20;

        // Send input 0.5 => IEEE 754 32-bit = 0x3F000000
        in_data = {y_fixed, x_fixed};  // atanh(0.5) ? 0.5493
        valid_in = 1;
        #20;
        valid_in = 0;

        // Wait for output
        wait(valid_out == 1);
        #1;
        $display("Received output (16-bit half float): %h", out_data);
        if (valid_out == 1) begin 
            fixed_in = out_data;
        end
        
        #20;
        valid_fixed = 1;
        #20;
        valid_fixed = 0;
        wait(valid_float==1);
        #1;
        if (valid_float == 1) begin
            float32_in = out_float;
        end
        #20;
        valid_f32_in = 1;
        #20;
        valid_f32_in = 0;
        wait(valid_f16_out==1);
        #1;
       
        #40;
        $finish;
    end
    
    
    
endmodule
