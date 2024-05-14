module BTA_RCA_16_tb#(parameter N=16,m=16);
reg clk;
reg [(m*(N/4))-1:0]A,B,C,D;
reg C0;
wire [m+$clog2(N)-1:0]sum;
wire carry;

BTA_RCA_16 a1(clk,A,B,C,D,C0,sum,carry);

//initial repeat(255) #10 {A,B} = {A,B} + 8'b1;


initial begin

$dumpfile("BTA_RCA_16.vcd");
$dumpvars(0,BTA_RCA_16_tb);
end

initial begin
clk=0;
A=64'b0; B=64'b0; C=64'b0;D=64'b0; C0=0;
#20 A=64'h546239F8EAB23C98; B=64'h1234567890ABCDEF;C=64'h9876543210FEDCBA; D=64'hFFFFF66666555555;
//#20 A=16'b111001100001111; B=16'b0000010010111111;C=16'b0110100101111011; D=16'b0000100000011000;
//#20 A=16'b1110111010101101; B=16'b0010101001101110;
//#20 A=16'b1101010111011011; B=16'b1111111111111111;
#100 $finish;

end
always begin
#1 clk=~clk;
end

endmodule
