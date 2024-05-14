`timescale 1ns/1ps

module BTA_RCA_16_modified#(parameter N=16, m=16)(input clk,input [(m*(N/4))-1:0]A,B,C,D, input C0,output [m+$clog2(N)-1:0]sum, output carry);

wire [N-1:0]c;
wire [((m+1)*(N/2))-1:0]s1;

//integer n=0;
//integer j;


BTA_RCA_8 a1(clk,A[m-1:0],B[m-1:0],A[(2*m)-1:m],B[(2*m)-1:m],A[(3*m)-1:2*m],B[(3*m)-1:2*m],A[(4*m)-1:3*m],B[(4*m)-1:3*m],C0,s1[m+2:0],c[0]);

BTA_RCA_8 a2(clk,C[m-1:0],D[m-1:0],C[(2*m)-1:m],D[(2*m)-1:m],C[(3*m)-1:2*m],D[(3*m)-1:2*m],C[(4*m)-1:3*m],D[(4*m)-1:3*m],C0,s1[2*m+5:m+3],c[1]);

RCA_19 a3(clk,s1[m+2:0],s1[2*m+5:m+3],C0,sum[m+$clog2(N)-1:0],carry);

endmodule



