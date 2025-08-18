`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:46:53 PM
// Design Name: 
// Module Name: led_control
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


module led_control(input wire btn,
                input wire boot,
               output reg led0_b,
               output reg led1_g 
               );
               
    always @(*) begin
      if (btn == 0) begin
        if (boot ==0) begin
            led0_b = 1;
            led1_g = 0;
        end else begin
            led0_b = 0;
            led1_g = 1;
        end
      end else begin
        led0_b = 0;
        led1_g = 0;
      end
    end
    
endmodule