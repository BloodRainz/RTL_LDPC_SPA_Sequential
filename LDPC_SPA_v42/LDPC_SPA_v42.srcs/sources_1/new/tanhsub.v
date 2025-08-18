`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 22:11:55
// Design Name: 
// Module Name: tanhsub
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


module tanhsub(
        input wire signed [15:0] in_data,
        output reg [15:0]tanh_out
    );
    
    reg [15:0] tanhby2 [20:0];
    
    initial begin
        tanhby2[0] = 16'hBC00;  //bbff
        tanhby2[1] = 16'hBBFF;
        tanhby2[2] = 16'hBBFF;
        tanhby2[3] = 16'hBBFC;
        tanhby2[4] = 16'hBBF6;
        tanhby2[5] = 16'hBBE5;
        tanhby2[6] = 16'hBBB6;
        tanhby2[7] = 16'hBB3E;
        tanhby2[8] = 16'hBA18;
        tanhby2[9] = 16'hB765;
        tanhby2[10] = 16'h0000;
        tanhby2[11] = 16'h3765;
        tanhby2[12] = 16'h3A18;
        tanhby2[13] = 16'h3B3E;
        tanhby2[14] = 16'h3BB6;
        tanhby2[15] = 16'h3BE5;
        tanhby2[16] = 16'h3BF6;
        tanhby2[17] = 16'h3BFC;
        tanhby2[18] = 16'h3BFF;
        tanhby2[19] = 16'h3BFF;
        tanhby2[20] = 16'h3C00; //3bff

    end
    
    reg [7:0] addr;
    
    always @(*) begin
        if (in_data < -10) begin
            tanh_out = 16'hBC00;
        end else if (in_data>10) begin
            tanh_out = 16'h3C00;
        end else begin
            addr = in_data +10;
            tanh_out = tanhby2[addr];
        end
    end
    
    
endmodule
