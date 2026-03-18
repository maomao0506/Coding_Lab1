`include "ha.v"
module fa(a, b, ci, sum, cout);
// input and output declaration
input  a, b, ci;
output sum, cout;

// wire and reg declaration

wire s1, c1, c2;

// module instance

ha ha1 (.a(a), .b(b), .sum(s1), .cout(c1));
ha ha2 (.a(s1), .b(ci), .sum(sum), .cout(c2));

or u1(cout, c1, c2);

endmodule
