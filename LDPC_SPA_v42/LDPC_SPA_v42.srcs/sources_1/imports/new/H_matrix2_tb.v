module H_matrix2_tb;

    reg  [10:0] row;
    reg  [11:0] col;
    wire        bit;

    Hmat_gen #(.M(512)) uut (
        .row(row),
        .col(col),
        .H_bit(bit)
    );
    integer outfile;
    initial begin
        outfile = $fopen("H_matrix_sparse.txt", "w");
        // Example: Check some entries of H
        for (row = 0; row < 1536; row= row+1) begin 
            for (col =0; col < 2560; col = col+1) begin
                #1;
                if (bit == 1) begin
                    $fwrite(outfile, "%0d %0d\n", row, col);  // sparse format: (row, col)
                end
                $display("H[%0d][%0d] = %b", row, col, bit);
            end
        end
        
        $fclose(outfile);
        $display("Done. Output written to H_matrix_sparse.txt");
        $finish;       

        //$finish;
    end
endmodule