module  ha(a, b, sum, cout);
// input and output interface
input a, b;
output sum, cout;

// structural modeling

xor u1 (sum, a, b);
and u2 (cout, a, b);

endmodule

