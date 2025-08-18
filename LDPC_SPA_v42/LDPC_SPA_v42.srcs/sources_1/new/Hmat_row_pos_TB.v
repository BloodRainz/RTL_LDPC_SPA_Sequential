`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.06.2025 17:29:05
// Design Name: 
// Module Name: Hmat_row_pos_TB
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


module Hmat_row_pos_TB(

    );
    
    reg [11:0] addr;
    wire [11:0] val0, val1,val2, val3,val4, val5;
    wire [2:0] Hr_count;
    
    Hmat_row_pos uut(
        .Hrow_addr(addr),
        .Hcol0(val0),
        .Hcol1(val1),
        .Hcol2(val2),
        .Hcol3(val3),
        .Hcol4(val4),
        .Hcol5(val5)  );
        
    Hrow_count ut(
        .addr(addr),
        .Hr_count(Hr_count) );
        
    initial begin
        $display("Time\tAddr\tVal0\tVal1\tetc");
        
        for (addr = 0; addr < 1536; addr= addr+1) begin
            #1;
            $display("%4dns\t%2d\t%4d\t%3d\t%4d\t%4d\t%4d\t%4d\t%3d", $time, addr, val0, val1, val2, val3, val4, val5,Hr_count);
        
        end
        $finish; 
    end
    
endmodule
