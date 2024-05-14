`timescale 1ns/1ps

module BTA_RCA_8#(parameter N=8,m=16)(input clk,input [m-1:0]A,B,C,D,E,F,G,H, input C0,output [m+2:0]sum, output carry);
wire [N-1:0]c;
wire [105:0]s;

//1st stage -- N/2  -- here 4RCA's of each 16bits

rca_even_16 a1(clk,A[m-1:0],B[m-1:0],C0,s[m:0],c[0]);
rca_even_16 a2(clk,C[m-1:0],D[m-1:0],C0,s[m+17:m+1],c[1]);
rca_even_16 a3(clk,E[m-1:0],F[m-1:0],C0,s[m+34:m+18],c[2]);
rca_even_16 a4(clk,G[m-1:0],H[m-1:0],C0,s[m+51:m+35],c[3]);

//2nd stage --N/4 --here 2RCA's of each 17bits

rca_odd_17 a5(clk, s[m:0],s[m+17:m+1],C0, s[m+69:m+52],c[4]);
rca_odd_17 a6(clk, s[m+34:m+18],s[m+51:m+35],C0, s[m+87:m+70],c[5]);

// 3rd stage --N/8 --here 1RCA of 18bits

rca_even_18 a7(clk, s[m+69:m+52],s[m+87:m+70],C0,sum[m+2:0],carry);

endmodule

 /////////////////


module aoi(
    input clk,
    input a,
    input b,
    input cin,
    output reg s,
    output reg cout
    );
    
    reg p,g;
always @(posedge clk) begin    
     p = a ^ b;
    g = a & b;
     cout = ~ ( g | ( p & cin));
     s = p ^ cin;
end    
endmodule


//////////////////////

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

//////////////////////////////////////


module rca_even_18 #(parameter N=18)(
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
for ( i =1 ; i < (N-1) ; i=i+1) begin

if((i%2)==1) begin 
oai o1(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end

else begin
aoi a2(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end 

end
endgenerate

oai o2(clk,a[N-1],b[N-1],c1[N-2],s1[N-1],cout);

assign sum = {cout,s1[N-1:0]};
   
endmodule

///////////////////////////////////////


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



////////////////////////////////

module rca_even_16 #(parameter N=16)(
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
for ( i =1 ; i < (N-1) ; i=i+1) begin

if((i%2)==1) begin 
oai o1(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end

else begin
aoi a2(clk,a[i],b[i],c1[i-1],s1[i],c1[i]);
end 

end
endgenerate

oai o2(clk,a[N-1],b[N-1],c1[N-2],s1[N-1],cout);

assign sum = {cout,s1[N-1:0]};
   
endmodule
























