`timescale 1ns/1ps

module BTA_CLA_16#(parameter N=16, m=16)(input clk,input [(m*(N/4))-1:0]A,B,C,D, input C0,output [m+$clog2(N)-1:0]sum, output carry);

wire [N-1:0]c;
wire [((m+1)*(N/2))-1:0]s1;

//integer n=0;
//integer j;


BTA_CLA_8 a1(clk,A[m-1:0],B[m-1:0],A[(2*m)-1:m],B[(2*m)-1:m],A[(3*m)-1:2*m],B[(3*m)-1:2*m],A[(4*m)-1:3*m],B[(4*m)-1:3*m],C0,s1[m+2:0],c[0]);

BTA_CLA_8 a2(clk,C[m-1:0],D[m-1:0],C[(2*m)-1:m],D[(2*m)-1:m],C[(3*m)-1:2*m],D[(3*m)-1:2*m],C[(4*m)-1:3*m],D[(4*m)-1:3*m],C0,s1[2*m+5:m+3],c[1]);

CLA_19 a3(clk,s1[m+2:0],s1[2*m+5:m+3],C0,sum[m+$clog2(N)-1:0],carry);

endmodule

////////////////////////////////

`timescale 1ns/1ps

module BTA_CLA_8 #(parameter N=8,m=16)(input clk,input [m-1:0]A,B,C,D,E,F,G,H, input C0,output [m+2:0]sum, output carry);
wire [N-1:0]c;
wire [105:0]s;

//1st stage -- N/2  -- here 4RCA's of each 16bits

CLA_16 a1(clk,A[m-1:0],B[m-1:0],C0,s[m:0],c[0]);
CLA_16 a2(clk,C[m-1:0],D[m-1:0],C0,s[m+17:m+1],c[1]);
CLA_16 a3(clk,E[m-1:0],F[m-1:0],C0,s[m+34:m+18],c[2]);
CLA_16 a4(clk,G[m-1:0],H[m-1:0],C0,s[m+51:m+35],c[3]);

//2nd stage --N/4 --here 2RCA's of each 17bits

CLA_17 a5(clk, s[m:0],s[m+17:m+1],C0, s[m+69:m+52],c[4]);
CLA_17 a6(clk, s[m+34:m+18],s[m+51:m+35],C0, s[m+87:m+70],c[5]);

// 3rd stage --N/8 --here 1RCA of 18bits

CLA_18 a7(clk, s[m+69:m+52],s[m+87:m+70],C0,sum[m+2:0],carry);

endmodule

/////////////////////////////////////

module CLA_16#(parameter m=16)(input clk,input [m-1:0]A, input [m-1:0]B,input C0, output [m:0]Sum, output Carry);
  reg [m-1:0]p, g;
  reg [m:0]c;
  wire [m-1:0]s;
  integer i;

always @(posedge clk)begin
c[0]=C0;
for(i=0;i<m;i=i+1)begin
p[i]=A[i]^B[i];
g[i]=A[i]&B[i];
c[i+1]=(c[i]&p[i]) + g[i];
end
end

genvar j;
generate 
for(j=0;j<m;j=j+1)begin
add a1(p[j],c[j],s[j]);

end
endgenerate
assign Carry = c[m];
assign Sum ={c[m],s[m-1:0]};

endmodule


//module add(input P,C,output sum);

//assign sum=P^C;
//endmodule

/////////////////////

module CLA_17#(parameter m=17)(input clk,input [m-1:0]A, input [m-1:0]B,input C0, output [m:0]Sum, output Carry);
  reg [m-1:0]p, g;
  reg [m:0]c;
  wire [m-1:0]s;
  integer i;

always @(posedge clk)begin
c[0]=C0;
for(i=0;i<m;i=i+1)begin
p[i]=A[i]^B[i];
g[i]=A[i]&B[i];
c[i+1]=(c[i]&p[i]) + g[i];
end
end

genvar j;
generate 
for(j=0;j<m;j=j+1)begin
add a1(p[j],c[j],s[j]);

end
endgenerate
assign Carry = c[m];
assign Sum ={c[m],s[m-1:0]};

endmodule


//module add(input P,C,output sum);

//assign sum=P^C;
//endmodule
/////////////////////////////

module CLA_18#(parameter m=18)(input clk,input [m-1:0]A, input [m-1:0]B,input C0, output [m:0]Sum, output Carry);
  reg [m-1:0]p, g;
  reg [m:0]c;
  wire [m-1:0]s;
  integer i;

always @(posedge clk)begin
c[0]=C0;
for(i=0;i<m;i=i+1)begin
p[i]=A[i]^B[i];
g[i]=A[i]&B[i];
c[i+1]=(c[i]&p[i]) + g[i];
end
end

genvar j;
generate 
for(j=0;j<m;j=j+1)begin
add a1(p[j],c[j],s[j]);

end
endgenerate
assign Carry = c[m];
assign Sum ={c[m],s[m-1:0]};

endmodule

////////////////////////////

module CLA_19#(parameter m=19)(input clk,input [m-1:0]A, input [m-1:0]B,input C0, output [m:0]Sum, output Carry);
  reg [m-1:0]p, g;
  reg [m:0]c;
  wire [m-1:0]s;
  integer i;

always @(posedge clk)begin
c[0]=C0;
for(i=0;i<m;i=i+1)begin
p[i]=A[i]^B[i];
g[i]=A[i]&B[i];
c[i+1]=(c[i]&p[i]) + g[i];
end
end

genvar j;
generate 
for(j=0;j<m;j=j+1)begin
add a1(p[j],c[j],s[j]);

end
endgenerate
assign Carry = c[m];
assign Sum ={c[m],s[m-1:0]};

endmodule


/////////////////////////////////

module add(input P,C,output sum);

assign sum=P^C;
endmodule
