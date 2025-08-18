`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2025 06:16:29 PM
// Design Name: 
// Module Name: rx_data_TB
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


module rx_data_TB(

    );
    
    reg [11:0] addr;
    wire signed [15:0] data_out;
    
    rx_data_gen rx_data (
        .address(addr),
        .llr_data(data_out)
    );
    
    initial begin
        $display("Time\tAddress\tData_out");
        $monitor("%0t\t%0d\t%0d", $time, addr, data_out);

        // Loop through all possible 4-bit addresses
        for (integer i = 0; i < 2600; i = i + 1) begin
            addr = i[12:0];   // Assign address
            #1;                // Wait some time for output to settle
            //$display("%4dns\t%2d\t%4d\t", $time, addr, data_out);
        end

        $finish;
    end
    
endmodule
