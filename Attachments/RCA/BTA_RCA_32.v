`timescale 1ns/1ps

module BTA_RCA_32#(parameter N=32, m=16)(input clk,input [(m*(N/8))-1:0]A,B,C,D,E,F,G,H, input C0,output [m+$clog2(N)-1:0]sum, output carry);

wire [N-1:0]c;
wire [((m+1)*(N/2))-1:0]s1;

//integer n=0;
//integer j;


BTA_RCA_16_modified a1(clk,A[(m*(N/8))-1:0],B[(m*(N/8))-1:0],C[(m*(N/8))-1:0],D[(m*(N/8))-1:0], C0,s1[m+$clog2(N/2)-1:0],c[0]);

BTA_RCA_16_modified a2(clk,E[(m*(N/8))-1:0],F[(m*(N/8))-1:0],G[(m*(N/8))-1:0],H[(m*(N/8))-1:0],C0,s1[2*m+7:m+$clog2(N/2)],c[1]);

RCA_20bit a3(clk,s1[m+$clog2(N/2)-1:0],s1[2*m+7:m+$clog2(N/2)],C0,sum[m+$clog2(N)-1:0],carry);

endmodule


