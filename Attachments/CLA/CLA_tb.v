`timescale 1ns/1ps

module CLA_tb#(parameter m=16);

reg clk;
reg [m-1:0]A,B;
reg C0;
wire [m:0]sum;
wire carry;

CLA a1(clk,A,B,C0,sum,carry);

//initial repeat(255) #10 {A,B} = {A,B} + 8'b1;


initial begin

$dumpfile("CLA.vcd");
$dumpvars(0,CLA_tb);
end

initial begin
clk=0;
A=16'b0;B=16'b0;C0=0;
//#20 A=4'b1010;B=4'b1111;
//#20 A=4'b0101; B=4'b1100;
//A=64'b0; B=64'b0; C=64'b0;D=64'b0; C0=0;
//#20 A=64'h546239F8EAB23C98; B=64'h1234567890ABCDEF;C=64'h9876543210FEDCBA; D=64'hFFFFF66666555555;
//#20 A=16'b111001100001111; B=16'b0000010010111111;C=16'b0110100101111011; D=16'b0000100000011000;
#20 A=16'b1110111010101101; B=16'b0010101001101110;
#20 A=16'b1101010111011011; B=16'b1111111111111111;
#100 $finish;

end
always begin
#1 clk=~clk;
end

endmodule
