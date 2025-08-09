`timescale 1ns / 1ps



module multiplier_4x4_tb();
    reg[3:0] a,b;
    wire[7:0] p;
    
    multiplier_4x4 uut (a, b, p);
    
    initial begin 
        a = 4'b1000;
        b = 4'b1000;
        #10;
        a = 4'b1010;
        b = 4'b1011;
        #10;
        $finish;
    end
endmodule
