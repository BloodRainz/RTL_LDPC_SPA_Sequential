`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.07.2025 16:29:03
// Design Name: 
// Module Name: half_float_by2
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


module half_float_by2(
    input  wire [15:0] in,
    output reg  [15:0] out
);

    wire sign;
    wire [4:0] exponent;
    wire [9:0] mantissa;

    assign sign     = in[15];
    assign exponent = in[14:10];
    assign mantissa = in[9:0];

    always @(*) begin
        if (exponent > 5'd0) begin
            // Normal case: just subtract 1 from exponent
            out = {sign, exponent - 1'b1, mantissa};
        end else begin
            // Subnormal or zero: right shift mantissa
            out = {sign, 5'b00000, mantissa >> 1};
        end
    end

endmodule
