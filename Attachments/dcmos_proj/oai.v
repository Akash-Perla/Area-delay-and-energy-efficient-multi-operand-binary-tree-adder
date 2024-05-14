`timescale 1ns / 1ps

module oai (
    input clk,
    input  a,
    input  b,
    input  cin,
    output  reg s,
    output  reg cout
    );
    
    reg p,g;
 always @(posedge clk)    begin
 
    p = a ^ b;
     g =  a & b;
     cout = ~((~g) & ((~p) | cin));
     s = (~p) ^ cin;
end    
endmodule
