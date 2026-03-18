`timescale 1ns / 1ps
`include "FA_Encoder.v"

module tb_multiplexer_2to1;

    reg  [3:0] A, B;   // 4-bit inputs for adder
    reg  [1:0] X;      // 2-bit input for encoder
    reg        sel;    // Select signal
    wire [3:0] Y;      // 4-bit output

    reg  [3:0] expected_Y; // 預期輸出值

    // Instantiate the multiplexer module
    multiplexer_2to1 uut (
        .A(A), .B(B),
        .X(X),
        .sel(sel),
        .Y(Y)
    );

    //波形產生
    initial
    begin
        $dumpfile("top.vcd");
        $dumpvars(0, tb_multiplexer_2to1);
    end

    /*initial
    begin
        $fsdbDumpfile("top.fsdb");
        $fsdbDumpvars;
    end
    */

    // 自動驗證結果
    task check_output;
        input [3:0] expected;
        begin
            if (Y === expected) begin
                $display("PASS: sel = %b | A = %b, B = %b | X = %b | Y = %b (Expected = %b)", sel, A, B, X, Y, expected);
            end else begin
                $display("FAIL: sel = %b | A = %b, B = %b | X = %b | Y = %b (Expected = %b)", sel, A, B, X, Y, expected);
            end
        end
    endtask

    initial begin
        // Test Case 1: 4-bit Adder (A = 4, B = 3, sel = 0) → Expected Y = 7
        A = 4'b0100; B = 4'b0011; X = 2'b00; sel = 0; expected_Y = 4'b0111;
        #10; check_output(expected_Y);

        // Test Case 2: 4-bit Adder (A = 8, B = 7, sel = 0) → Expected Y = 15
        A = 4'b1000; B = 4'b0111; sel = 0; expected_Y = 4'b1111;
        #10; check_output(expected_Y);

        // Test Case 3: 2-to-4 Encoder (X = 2'b00, sel = 1) → Expected Y = 0001
        X = 2'b00; sel = 1; expected_Y = 4'b0001;
        #10; check_output(expected_Y);

        // Test Case 4: 2-to-4 Encoder (X = 2'b01, sel = 1) → Expected Y = 0010
        X = 2'b01; sel = 1; expected_Y = 4'b0010;
        #10; check_output(expected_Y);

        // Test Case 5: 2-to-4 Encoder (X = 2'b10, sel = 1) → Expected Y = 0100
        X = 2'b10; sel = 1; expected_Y = 4'b0100;
        #10; check_output(expected_Y);

        // Test Case 6: 2-to-4 Encoder (X = 2'b11, sel = 1) → Expected Y = 1000
        X = 2'b11; sel = 1; expected_Y = 4'b1000;
        #10; check_output(expected_Y);

        // 結束模擬
        $finish;
    end

endmodule
