`timescale 1ns / 1ps



module carry_look_ahead_tb();
    reg[3:0] a,b;
    reg c0;
    wire[3:0] sum;
    wire cout;
    
    carry_look_ahead uut (a, b, c0, sum, cout);
    
    initial begin 
        a = 4'b1001;b = 4'b0111;c0 = 1'b1;#10;
        a = 4'b1011;b = 4'b1111;c0 = 1'b1;#10;
        a = 4'b1101;b = 4'b0111;c0 = 1'b0;#10;
        $finish;
    end
endmodule
