`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 16:35:43
// Design Name: 
// Module Name: tanh_v3
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


module tanh_v3(
        input wire signed [15:0] in_data,
        output reg [15:0]tanh_out
    );
    
    (* ram_style = "block" *) reg [15:0] tanh [33:0];
    
    initial begin
        tanh[0] = 16'hBBB6; //bbff
        tanh[1] = 16'hBBA6;
        tanh[2] = 16'hBB93;
        tanh[3] = 16'hBB7C;
        tanh[4] = 16'hBB60;
        tanh[5] = 16'hBB3E;
        tanh[6] = 16'hBB15;
        tanh[7] = 16'hBAE5;
        tanh[8] = 16'hBAAB;
        tanh[9] = 16'hBA67;
        tanh[10] = 16'hBA18;
        tanh[11] = 16'hB9BB;
        tanh[12] = 16'hB950;
        tanh[13] = 16'hB8D6;
        tanh[14] = 16'hB84C;
        tanh[15] = 16'hB765;
        tanh[16] = 16'hB614;
        tanh[17] = 16'h3614;
        tanh[18] = 16'h3765;
        tanh[19] = 16'h384C;
        tanh[20] = 16'h38D6;
        tanh[21] = 16'h3950;
        tanh[22] = 16'h39BB;
        tanh[23] = 16'h3A18;
        tanh[24] = 16'h3A67;
        tanh[25] = 16'h3AAB;
        tanh[26] = 16'h3AE5;
        tanh[27] = 16'h3B15;
        tanh[28] = 16'h3B3E;
        tanh[29] = 16'h3B60;
        tanh[30] = 16'h3B7C;
        tanh[31] = 16'h3B93;
        tanh[32] = 16'h3BA6;
        tanh[33] = 16'h3BB6;  //3bff
        
    end
    
    reg [7:0] addr;
    
    always @(*) begin
        if (in_data[14:0] >= 15'h4000) begin
            tanh_out[14:0] = 15'h3C00;
            tanh_out[15] = in_data[15];
        end  else if (in_data[14:0] < 14'h3666) begin
            tanh_out = in_data;
        end else begin
            if (in_data[15] == 1) begin
                if (in_data[14:0] <= (15'h3666)) addr = 8'd16;
                else if (in_data[14:0] < (15'h3800)) addr = 8'd15;
                else if (in_data[14:0] < (15'h38CD)) addr = 8'd14;
                else if (in_data[14:0] < (15'h399A)) addr = 8'd13;
                else if (in_data[14:0] < (15'h3A66)) addr = 8'd12;
                else if (in_data[14:0] < (15'h3B33)) addr = 8'd11;
                else if (in_data[14:0] < (15'h3C00)) addr = 8'd10;
                else if (in_data[14:0] < (15'h3C66)) addr = 8'd9;
                else if (in_data[14:0] < (15'h3CCD)) addr = 8'd8;
                else if (in_data[14:0] < (15'h3D33)) addr = 8'd7;
                else if (in_data[14:0] < (15'h3D9A)) addr = 8'd6;
                else if (in_data[14:0] < (15'h3E00)) addr = 8'd5;
                else if (in_data[14:0] < (15'h3E66)) addr = 8'd4;
                else if (in_data[14:0] < (15'h3ECD)) addr = 8'd3;
                else if (in_data[14:0] < (15'h3F33)) addr = 8'd2;
                else if (in_data[14:0] < (15'h3F9A)) addr = 8'd1;
                else if (in_data[14:0] < (15'h4000)) addr = 8'd0;
                else                         addr = 8'd0;
            end else begin
                if (in_data[14:0] <= (15'h3666)) addr = 8'd17;
                else if (in_data[14:0] < (15'h3800)) addr = 8'd18;
                else if (in_data[14:0] < (15'h38CD)) addr = 8'd19;
                else if (in_data[14:0] < (15'h399A)) addr = 8'd20;
                else if (in_data[14:0] < (15'h3A66)) addr = 8'd21;
                else if (in_data[14:0] < (15'h3B33)) addr = 8'd22;
                else if (in_data[14:0] < (15'h3C00)) addr = 8'd23;
                else if (in_data[14:0] < (15'h3C66)) addr = 8'd24;
                else if (in_data[14:0] < (15'h3CCD)) addr = 8'd25;
                else if (in_data[14:0] < (15'h3D33)) addr = 8'd26;
                else if (in_data[14:0] < (15'h3D9A)) addr = 8'd27;
                else if (in_data[14:0] < (15'h3E00)) addr = 8'd28;
                else if (in_data[14:0] < (15'h3E66)) addr = 8'd29;
                else if (in_data[14:0] < (15'h3ECD)) addr = 8'd30;
                else if (in_data[14:0] < (15'h3F33)) addr = 8'd31;
                else if (in_data[14:0] < (15'h3F9A)) addr = 8'd32;
                else if (in_data[14:0] < (15'h4000)) addr = 8'd33;
                else                         addr = 8'd33;
            end
            tanh_out = tanh[addr];
        
        end
    end
    
endmodule