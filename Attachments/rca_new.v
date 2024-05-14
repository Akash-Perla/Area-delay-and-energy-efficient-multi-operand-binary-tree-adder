`timescale 1ns / 1ps


module rca_new #(parameter N=4)(
    input clk,
    input [N-1:0]a,
    input [N-1:0]b,
    input cin,
    output [N-1:0]s,
    output cout,
    output reg [N:0]result
    );
 
 wire [N-1:0]c1;
 aoi a1(clk,a[0] , b[0], cin, s[0], c1[0]);  
genvar i;
generate 
for ( i =1 ; i < (N-1) ; i=i+1) begin

if((i%2)==1) begin 
oai o1(clk,a[i],b[i],c1[i-1],s[i],c1[i]);
end

else begin
aoi a2(clk,a[i],b[i],c1[i-1],s[i],c1[i]);
end 

end
endgenerate

oai o2(clk,a[N-1],b[N-1],c1[N-2],s[N-1],cout);

 //result < = {cout,s[N-1:0]};
   
endmodule
