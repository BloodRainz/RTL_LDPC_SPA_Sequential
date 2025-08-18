`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2025 03:44:32 PM
// Design Name: 
// Module Name: H_mat_bits
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


module H_mat_bits #(parameter M = 512)(
    input  wire [10:0] row,  // up to 3*M = 1536
    input  wire [11:0] col,  // up to 5*M = 2560
    output wire       H_bit
    //output reg [2559:0]  H_bit [0:1535]
);

    // Local parameters
    localparam M4 = M / 4;

    // Theta and Phi_k values (hardcoded)
    function [1:0] get_theta(input [2:0] k);
        case (k)
            3'd0: get_theta = 2'd3;
            3'd1: get_theta = 2'd0;
            3'd2: get_theta = 2'd1;
            3'd3: get_theta = 2'd2;
            3'd4: get_theta = 2'd2;
            3'd5: get_theta = 2'd3;
            3'd6: get_theta = 2'd0;
            3'd7: get_theta = 2'd1;
        endcase
    endfunction

    function [6:0] get_phi(input [2:0] k, input [1:0] j);
        case (k)
            3'd0: case(j) 2'd0: get_phi=7'd16;  default: get_phi=7'd0; endcase
            3'd1: case(j) 2'd0: get_phi=7'd103; 2'd1: get_phi=7'd53; 2'd2: get_phi=7'd8;   2'd3: get_phi=7'd35;  endcase
            3'd2: case(j) 2'd0: get_phi=7'd105; 2'd1: get_phi=7'd74; 2'd2: get_phi=7'd119; 2'd3: get_phi=7'd97;  endcase
            3'd3: case(j) 2'd0: get_phi=7'd0;   2'd1: get_phi=7'd45; 2'd2: get_phi=7'd89;  2'd3: get_phi=7'd112; endcase
            3'd4: case(j) 2'd0: get_phi=7'd50;  2'd1: get_phi=7'd47; 2'd2: get_phi=7'd31;  2'd3: get_phi=7'd64;  endcase
            3'd5: case(j) 2'd0: get_phi=7'd29;  2'd1: get_phi=7'd0;  2'd2: get_phi=7'd122; 2'd3: get_phi=7'd93;  endcase
            3'd6: case(j) 2'd0: get_phi=7'd115; 2'd1: get_phi=7'd59; 2'd2: get_phi=7'd1;   2'd3: get_phi=7'd99;  endcase
            3'd7: case(j) 2'd0: get_phi=7'd30;  2'd1: get_phi=7'd102;2'd2: get_phi=7'd69;  2'd3: get_phi=7'd94;  endcase
        endcase
    endfunction

    // Internal signals
    wire H_top_bit, H_mid_bit, H_bot_bit;

    // Submatrix selectors
    wire top_row = (row < M);
    wire mid_row = (row >= M) && (row < 2*M);
    wire bot_row = (row >= 2*M);

    // Compute each row group output
    assign H_top_bit =
        (col >= 2*M && col < 3*M && row == col - 2*M) ? 1'b1 : // I_M at (2nd col block)
        (col >= 4*M && col < 5*M) ? ( (row == col - 4*M) ^ pi_entry(row, col - 4*M, 3'd0) ) : 1'b0; // I+Pi1

    assign H_mid_bit =
        ((row >= M && row < 2*M) && (col == row - M)) ? 1'b1 : // I_M
        ((row >= M && row < 2*M) && (col == row)) ? 1'b1 :
        ((row >= M && row < 2*M) && (col == row + 2*M)) ? 1'b1 :
        (col >= 4*M && col < 5*M) ? (pi_entry(row - M, col - 4*M, 3'd1) ^
                                    pi_entry(row - M, col - 4*M, 3'd2) ^
                                    pi_entry(row - M, col - 4*M, 3'd3)) : 1'b0;

    assign H_bot_bit =
        ((col < M) && (row == col + 2*M)) ? 1'b1 :
        (col >= M && col < 2*M) ? (pi_entry(row - 2*M, col - M, 3'd4) ^ pi_entry(row - 2*M, col - M, 3'd5)) :
        (col >= 3*M && col < 4*M) ? (pi_entry(row - 2*M, col - 3*M, 3'd6) ^ pi_entry(row - 2*M, col - 3*M, 3'd7)) :
        (col >= 4*M && col < 5*M && (row - 2*M == col - 4*M)) ? 1'b1 : 1'b0;

    assign H_bit = top_row ? H_top_bit : mid_row ? H_mid_bit : H_bot_bit;

    // Permutation matrix function
    function pi_entry(input [10:0] i, input [10:0] k_col, input [2:0] k);
        reg [1:0] j;
        reg [6:0] phi;
        reg [10:0] pi_val;
        begin
            j = (4 * i) / M;
            phi = get_phi(k, j);
            pi_val = M4 * ((get_theta(k) + j) % 4) + (phi + i) % M4;
            pi_entry = (k_col == pi_val) ? 1'b1 : 1'b0;
        end
    endfunction

endmodule
