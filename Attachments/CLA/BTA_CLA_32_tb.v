module BTA_CLA_32_tb#(parameter N=32,m=16);
reg clk;
reg [(m*(N/8))-1:0]A,B,C,D,E,F,G,H;
reg C0;
wire [m+$clog2(N)-1:0]sum;
wire carry;

BTA_CLA_32 a1(clk,A,B,C,D,E,F,G,H,C0,sum,carry);

//initial repeat(255) #10 {A,B} = {A,B} + 8'b1;


initial begin

$dumpfile("BTA_CLA_32.vcd");
$dumpvars(0,BTA_CLA_32_tb);
end

initial begin
clk=0;
A=64'b0; B=64'b0; C=64'b0;D=64'b0; E=64'b0; F=64'b0; G=64'B0; H=64'B0; C0=0;
#20 A=64'h546239F8EAB23C98; B=64'h1234567890ABCDEF;C=64'h9876543210FEDCBA; D=64'hFFFFF66666555555; E=64'h0001000100010001; F=64'h0010001000100010;G=64'h0011001100110011; H=64'h0100010001000100;
//#20 A=16'b111001100001111; B=16'b0000010010111111;C=16'b0110100101111011; D=16'b0000100000011000;
//#20 A=16'b1110111010101101; B=16'b0010101001101110;
//#20 A=16'b1101010111011011; B=16'b1111111111111111;
#100 $finish;

end
always begin
#1 clk=~clk;
end

endmodule
