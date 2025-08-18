`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.07.2025 19:00:44
// Design Name: 
// Module Name: atanh_lut
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


module atanh_lut(
        input wire signed [15:0] in_data,
        output reg [15:0]atanh_out
    );
    
    (* ram_style = "block" *) reg [15:0] atanh [57:0];
    
    initial begin
        atanh[0] = 16'hC79A;
        atanh[1] = 16'hC6E8;
        atanh[2] = 16'hC680;
        atanh[3] = 16'hC636;
        atanh[4] = 16'hC5FD;
        atanh[5] = 16'hC5CE;
        atanh[6] = 16'hC5A7;
        atanh[7] = 16'hC584;
        atanh[8] = 16'hC566;
        atanh[9] = 16'hC54B;
        atanh[10] = 16'hC498;
        atanh[11] = 16'hC42F;
        atanh[12] = 16'hC3C9;
        atanh[13] = 16'hC354;
        atanh[14] = 16'hC2F4;
        atanh[15] = 16'hC2A2;
        atanh[16] = 16'hC25B;
        atanh[17] = 16'hC21C;
        atanh[18] = 16'hC1E4;
        atanh[19] = 16'hC1B0;
        atanh[20] = 16'hC181;
        atanh[21] = 16'hC155;
        atanh[22] = 16'hC12C;
        atanh[23] = 16'hC106;
        atanh[24] = 16'hC0E2;
        atanh[25] = 16'hC0C1;
        atanh[26] = 16'hC0A1;
        atanh[27] = 16'hC082;
        atanh[28] = 16'hC065;
        atanh[29] = 16'h4065;
        atanh[30] = 16'h4082;
        atanh[31] = 16'h40A1;
        atanh[32] = 16'h40C1;
        atanh[33] = 16'h40E2;
        atanh[34] = 16'h4106;
        atanh[35] = 16'h412C;
        atanh[36] = 16'h4155;
        atanh[37] = 16'h4181;
        atanh[38] = 16'h41B0;
        atanh[39] = 16'h41E4;
        atanh[40] = 16'h421C;
        atanh[41] = 16'h425B;
        atanh[42] = 16'h42A2;
        atanh[43] = 16'h42F4;
        atanh[44] = 16'h4354;
        atanh[45] = 16'h43C9;
        atanh[46] = 16'h442F;
        atanh[47] = 16'h4498;
        atanh[48] = 16'h454B;
        atanh[49] = 16'h4566;
        atanh[50] = 16'h4584;
        atanh[51] = 16'h45A7;
        atanh[52] = 16'h45CE;
        atanh[53] = 16'h45FD;
        atanh[54] = 16'h4636;
        atanh[55] = 16'h4680;
        atanh[56] = 16'h46E8;
        atanh[57] = 16'h479A;

    end
    
    reg [7:0] addr;
    
    always @(*) begin
        if (in_data[14:0] >= 15'h3BFE) begin
            atanh_out[14:0] = 15'h479A;
            atanh_out[15] = in_data[15];
        end  else if (in_data[14:0] <= 14'h3A66) begin
            atanh_out[14:0] = 15'h4065;
            atanh_out[15] = in_data[15];
        end else begin
            if (in_data[15] == 1) begin
                if (in_data[14:0] < (15'h3A66)) addr = 8'd28;
                else if (in_data[14:0] < (15'h3A7B)) addr = 8'd27;
                else if (in_data[14:0] < (15'h3A8F)) addr = 8'd26;
                else if (in_data[14:0] < (15'h3AA4)) addr = 8'd25;
                else if (in_data[14:0] < (15'h3AB8)) addr = 8'd24;
                else if (in_data[14:0] < (15'h3ACD)) addr = 8'd23;
                else if (in_data[14:0] < (15'h3AE1)) addr = 8'd22;
                else if (in_data[14:0] < (15'h3AF6)) addr = 8'd21;
                else if (in_data[14:0] < (15'h3B0A)) addr = 8'd20;
                else if (in_data[14:0] < (15'h3B1F)) addr = 8'd19;
                else if (in_data[14:0] < (15'h3B33)) addr = 8'd18;
                else if (in_data[14:0] < (15'h3B48)) addr = 8'd17;
                else if (in_data[14:0] < (15'h3B5C)) addr = 8'd16;
                else if (in_data[14:0] < (15'h3B71)) addr = 8'd15;
                else if (in_data[14:0] < (15'h3B85)) addr = 8'd14;
                else if (in_data[14:0] < (15'h3B9A)) addr = 8'd13;
                else if (in_data[14:0] < (15'h3BAE)) addr = 8'd12;
                else if (in_data[14:0] < (15'h3BC3)) addr = 8'd11;
                else if (in_data[14:0] < (15'h3BD7)) addr = 8'd10;
                else if (in_data[14:0] < (15'h3BEC)) addr = 8'd9;
                else if (in_data[14:0] < (15'h3BEE)) addr = 8'd8;
                else if (in_data[14:0] < (15'h3BF0)) addr = 8'd7;
                else if (in_data[14:0] < (15'h3BF2)) addr = 8'd6;
                else if (in_data[14:0] < (15'h3BF4)) addr = 8'd5;
                else if (in_data[14:0] < (15'h3BF6)) addr = 8'd4;
                else if (in_data[14:0] < (15'h3BF8)) addr = 8'd3;
                else if (in_data[14:0] < (15'h3BFA)) addr = 8'd2;
                else if (in_data[14:0] < (15'h3BFC)) addr = 8'd1;
                else if (in_data[14:0] < (15'h3BFE)) addr = 8'd0;
                else    addr = 8'd0;
            end else begin
                if (in_data[14:0] < (15'h3A66)) addr = 8'd29;
                else if (in_data[14:0] < (15'h3A7B)) addr = 8'd30;
                else if (in_data[14:0] < (15'h3A8F)) addr = 8'd31;
                else if (in_data[14:0] < (15'h3AA4)) addr = 8'd32;
                else if (in_data[14:0] < (15'h3AB8)) addr = 8'd33;
                else if (in_data[14:0] < (15'h3ACD)) addr = 8'd34;
                else if (in_data[14:0] < (15'h3AE1)) addr = 8'd35;
                else if (in_data[14:0] < (15'h3AF6)) addr = 8'd36;
                else if (in_data[14:0] < (15'h3B0A)) addr = 8'd37;
                else if (in_data[14:0] < (15'h3B1F)) addr = 8'd38;
                else if (in_data[14:0] < (15'h3B33)) addr = 8'd39;
                else if (in_data[14:0] < (15'h3B48)) addr = 8'd40;
                else if (in_data[14:0] < (15'h3B5C)) addr = 8'd41;
                else if (in_data[14:0] < (15'h3B71)) addr = 8'd42;
                else if (in_data[14:0] < (15'h3B85)) addr = 8'd43;
                else if (in_data[14:0] < (15'h3B9A)) addr = 8'd44;
                else if (in_data[14:0] < (15'h3BAE)) addr = 8'd45;
                else if (in_data[14:0] < (15'h3BC3)) addr = 8'd46;
                else if (in_data[14:0] < (15'h3BD7)) addr = 8'd47;
                else if (in_data[14:0] < (15'h3BEC)) addr = 8'd48;
                else if (in_data[14:0] < (15'h3BEE)) addr = 8'd49;
                else if (in_data[14:0] < (15'h3BF0)) addr = 8'd50;
                else if (in_data[14:0] < (15'h3BF2)) addr = 8'd51;
                else if (in_data[14:0] < (15'h3BF4)) addr = 8'd52;
                else if (in_data[14:0] < (15'h3BF6)) addr = 8'd53;
                else if (in_data[14:0] < (15'h3BF8)) addr = 8'd54;
                else if (in_data[14:0] < (15'h3BFA)) addr = 8'd55;
                else if (in_data[14:0] < (15'h3BFC)) addr = 8'd56;
                else if (in_data[14:0] < (15'h3BFE)) addr = 8'd57;
                else                         addr = 8'd57;
            end
            atanh_out = atanh[addr];
        
        end
    end
    
endmodule
