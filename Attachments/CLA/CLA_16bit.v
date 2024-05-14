module CLA_16#(parameter m=17)(input clk,input [m-1:0]A, input [m-1:0]B,input C0, output [m:0]Sum, output Carry);
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


module add(input P,C,output sum);

assign sum=P^C;
endmodule

