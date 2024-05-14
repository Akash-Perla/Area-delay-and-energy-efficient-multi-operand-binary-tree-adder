module CLA_16bit_tb#(parameter N=17);
reg clk;
reg [N-1:0]A;
reg [N-1:0]B;
reg C0;
wire [N:0]sum;
wire carry;

CLA_16 a1(clk,A,B,C0,sum,carry);

//initial repeat(255) #10 {A,B} = {A,B} + 8'b1;


initial begin

$dumpfile("CLA_16bit.vcd");
$dumpvars(0,CLA_16bit_tb);
end

initial begin
clk=0;
A=17'b0; B=17'b0; C0=0;
#20 A=17'b01101111000111010; B=17'b01111000010101110;
//#20 A=16'b1110111010101101; B=16'b0010101001101110;
//#20 A=16'b1101010111011011; B=16'b1111111111111111;
#100 $finish;

end


always begin
#1 clk=~clk;
end

endmodule
