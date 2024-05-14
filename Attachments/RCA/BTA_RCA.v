`timescale 1ns/1ps

module BTA_RCA#(parameter N=8,m=16)(input clk,input [m-1:0]A,B,C,D,E,F,G,H, input C0,output [m+2:0]sum, output carry);
wire [N-1:0]c;
wire [105:0]s;

//1st stage -- N/2  -- here 4RCA's of each 4bits

RCA_16 a1(clk,A[m-1:0],B[m-1:0],C0,s[m:0],c[0]);
RCA_16 a2(clk,C[m-1:0],D[m-1:0],C0,s[m+17:m+1],c[1]);
RCA_16 a3(clk,E[m-1:0],F[m-1:0],C0,s[m+34:m+18],c[2]);
RCA_16 a4(clk,G[m-1:0],H[m-1:0],C0,s[m+51:m+35],c[3]);

//2nd stage --N/4 --here 2RCA's of each 5bits

RCA_17 a5(clk, s[m:0],s[m+17:m+1],C0, s[m+69:m+52],c[4]);
RCA_17 a6(clk, s[m+34:m+18],s[m+51:m+35],C0, s[m+87:m+70],c[5]);

// 3rd stage --N/8 --here 1RCA of 6bits

RCA_18 a7(clk, s[m+69:m+52],s[m+87:m+70],C0,sum[m+2:0],carry);

endmodule

 
