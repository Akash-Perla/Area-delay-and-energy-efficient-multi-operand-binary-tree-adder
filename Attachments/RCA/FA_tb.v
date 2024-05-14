module FA_tb();

reg A,B,C0;
wire Sum,Carry;

FA a1(.A(A),
      .B(B),
      .C0(C0),
      .Sum(Sum),
      .Carry(Carry)
      );

initial begin
		$dumpfile("FA.vcd");
		$dumpvars(0, FA_tb);
end

initial begin
A=1'b0; B=1'b0; C0=1'b0;
#5 A=1'b0; B=1'b0; C0=1'b1;
#5 A=1'b0; B=1'b1; C0=1'b0;
#5 A=1'b0; B=1'b1; C0=1'b1;
#5 A=1'b1; B=1'b0; C0=1'b0;
#5 A=1'b1; B=1'b0; C0=1'b1;
#5 A=1'b1; B=1'b1; C0=1'b0;
#5 A=1'b1; B=1'b1; C0=1'b1;
end


endmodule
