`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2025 14:11:37
// Design Name: 
// Module Name: half_float_mul2
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


module half_float_mul2 (
    input  [15:0] in,
    output [15:0] out
);

    wire sign = in[15];
    wire [4:0] exp = in[14:10];
    wire [9:0] frac = in[9:0];

    reg [4:0] new_exp;
    reg [15:0] result;

    always @(*) begin
        if (exp == 5'b00000) begin
            // Subnormal number or zero ? shift fraction
            result = {sign, 5'b00000, frac << 1};
        end else if (exp == 5'b11111) begin
            // Inf or NaN ? return unchanged
            result = in;
        end else if (exp == 5'b11110) begin
            // Overflow to Inf
            result = {sign, 5'b11111, 10'b0};
        end else begin
            // Normal case ? increment exponent
            new_exp = exp + 1;
            result = {sign, new_exp, frac};
        end
    end

    assign out = result;

endmodule
