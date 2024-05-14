module bta_rca_16_tb#(parameter N=16,m=16);
reg clk;
reg [63:0]A,B,C,D;
reg C0;
wire [m+3:0]sum;
wire carry;

BTA_RCA_16 a1(clk,A,B,C,D,C0,sum,carry);

//initial repeat(255) #10 {A,B} = {A,B} + 8'b1;


initial begin

$dumpfile("BTA_RCA_16.vcd");
$dumpvars(0,bta_rca_16_tb);
end

initial begin
clk=0;
A=16'b0; B=16'b0; C=16'b0;D=16'b0; C0=0;
#20 
A=64'b0101111000111010010110010011101001001000000011100011100111011010; B=64'b1111000010101110010110101100101001101011001111100101110010111110;  
C=64'b1110011000011110000010010111111011010010111101100001000000110000; D=64'b1111010111000111010110000100011000010010001110010101001110101111; 
//#100 $finish;

end
always begin
#1 clk=~clk;
end

endmodule
