`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.07.2025 06:32:42
// Design Name: 
// Module Name: tanhsub_v2
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


module tanhsub_v2(
        input wire signed [15:0] in_data,
        output reg [15:0]tanh_out
    );
    
    (* ram_style = "block" *) reg [15:0] tanhby2 [20:0];
    
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
        if (in_data[14:0] > 15'h4900) begin
            tanh_out[14:0] = 15'h3C00;
            tanh_out[15] = in_data[15];
        end  else if (in_data[14:0] < 15'h3800) begin
            tanh_out = in_data;
        end else begin
            if (in_data[15] == 0) begin
                if (in_data[14:0] < (15'h3800)) addr = 8'd10;
                else if (in_data[14:0] < (15'h3E00)) addr = 8'd11;
                else if (in_data[14:0] < (15'h4100)) addr = 8'd12;
                else if (in_data[14:0] < (15'h4300)) addr = 8'd13;
                else if (in_data[14:0] < (15'h4480)) addr = 8'd14;
                else if (in_data[14:0] < (15'h4580)) addr = 8'd15;
                else if (in_data[14:0] < (15'h4680)) addr = 8'd16;
                else if (in_data[14:0] < (15'h4780)) addr = 8'd17;
                else if (in_data[14:0] < (15'h4840)) addr = 8'd18;
                else if (in_data[14:0] < (15'h48C0)) addr = 8'd19;
                else                         addr = 8'd20;
            end else begin
                if (in_data[14:0] < (15'h3800)) addr = 8'd10;
                else if (in_data[14:0] < (15'h3E00)) addr = 8'd9;
                else if (in_data[14:0] < (15'h4100)) addr = 8'd8;
                else if (in_data[14:0] < (15'h4300)) addr = 8'd7;
                else if (in_data[14:0] < (15'h4480)) addr = 8'd6;
                else if (in_data[14:0] < (15'h4580)) addr = 8'd5;
                else if (in_data[14:0] < (15'h4680)) addr = 8'd4;
                else if (in_data[14:0] < (15'h4780)) addr = 8'd3;
                else if (in_data[14:0] < (15'h4840)) addr = 8'd2;
                else if (in_data[14:0] < (15'h48C0)) addr = 8'd1;
                else                         addr = 8'd0;
            end
            tanh_out = tanhby2[addr];
        
        end
    end
    
endmodule
