module multiplexer_2to1 (
    input  [3:0] A, B,   // 4-bit inputs for adder
    input  [1:0] X,      // 2-bit input for encoder
    input        sel,    // Select signal
    output [3:0] Y       // 4-bit output
);

assign Y = (sel) ? ( 4'b0001<< X ):(A+B) ;




 
endmodule
