`timescale 1ns / 1ps

module rca_tb #(parameter N=4);
    
    reg clk;
    reg [N-1:0] a;
    reg [N-1:0] b;
    reg cin;
    wire [N-1:0] s;
    wire cout;
    wire [N:0]result;
    
    rca_new #(N) dut (
        .clk(clk),
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );
    
    initial begin
        clk = 0;
        a = 4'b0;
        b = 4'b0;
        cin = 0;
        
//        #10; // Wait for 10 time units before changing inputs
//        a = 4'b1101;
//        b = 4'b0101;
        
        #10; // Wait for 10 time units before stopping the simulation
        
       a=4'b0101;
       b=4'b1001;
       
       #20;
       a=4'b1101;
       b=4'b1010;
       
    end

    always begin
        #1; // Toggle the clock every 5 time units
        clk = ~clk;
    end
    
endmodule
