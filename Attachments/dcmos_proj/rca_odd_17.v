`timescale 1ns / 1ps


module rca_odd_17 #(parameter N=17)(
    input clk,
    input [N-1:0]a,
    input [N-1:0]b,
    input cin,
    output [N:0]sum,
    output cout
   
    );
 wire [N-1:0]s1;
 wire [N-1:0]c1;
 aoi a1(clk,a[0] , b[0], cin, s1[0], c1[0]);  
genvar i;
generate 
for ( i =1 ; i <= (N-1) ; i=i+1) begin

if((i%2)==1) begin 
oai o1(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end

else begin
aoi a2(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end 

end
endgenerate

assign cout=~c1[N-1];
//oai o2(clk,a[N-1],b[N-1],c1[N-2],s1[N-1],cout);

assign sum = {cout,s1[N-1:0]};
   
endmodule


