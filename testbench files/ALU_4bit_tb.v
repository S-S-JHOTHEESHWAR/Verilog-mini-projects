`timescale 1ns / 1ps


module ALU_4bit_tb();
    reg clk, en;
    reg[2:0] op;
    reg[3:0] a,b;
    wire[3:0] result;
    wire carry_out, zero_flag;
    
    ALU_4bit uut(clk, en, op, a, b, result, carry_out, zero_flag);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        en = 0;#20;
        en = 1;
        a = 4'b1001;
        b = 4'b0011; 
        
        op = 3'b000;#10;
        op = 3'b001;#10;
        op = 3'b010;#10;
        op = 3'b011;#10;
        op = 3'b100;#10;
        op = 3'b101;#10;
        op = 3'b110;#10;
        op = 3'b111;#10;
        
        $finish;
        
       
    end
  
endmodule
