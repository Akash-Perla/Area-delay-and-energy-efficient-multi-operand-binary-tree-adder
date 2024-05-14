`timescale 1ns/1ps

module RCA_17 #(parameter N=17)( input clk,input [N-1:0]A,B, input C0, output [N:0]sum, output carry);

wire [N-1:0]C;
wire [N-1:0]sum1;

FA fa1(clk,A[0],B[0],C0,sum1[0],C[0]);

genvar i;
generate 
for(i=1;i<N-1;i=i+1)begin
FA fa2(clk,A[i],B[i],C[i-1],sum1[i],C[i]);
end
endgenerate

FA fa3(clk,A[N-1],B[N-1],C[N-2],sum1[N-1],carry);
assign sum ={carry,sum1[N-1:0]};

endmodule

