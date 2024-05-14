`timescale 1ns/1ps

module FA(input clk,A, B, C0, output reg Sum, Carry);
  reg p, g;

always @(posedge clk) begin

 p = A ^ B;
 g = A & B;
  Sum = p ^ C0;
  Carry = g | (p & C0);
end

endmodule

