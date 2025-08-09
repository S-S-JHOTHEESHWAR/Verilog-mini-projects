`timescale 1ns / 1ps



module ALU_4bit(
    input wire clk,
    input wire en,
    input wire[2:0] op,
    input wire[3:0] a,
    input wire[3:0] b,
    output reg[3:0] result,
    output reg carry_out,
    output reg zero_flag
    );
    
    reg[4:0] temp;
    
    always @ (posedge clk)begin 
        if(en)begin 
            carry_out = 0;
            case(op)
                3'b000: temp = a + b;
                3'b001: temp = a - b;
                3'b010: temp = a & b;
                3'b011: temp = a | b;
                3'b100: temp = a ^ b;
                3'b101: temp = ~a;
                3'b110: temp = a + 1'b1;
                3'b111: temp = a - 1'b1;
                default: temp = 4'b0000;
            endcase
            result[3:0] = temp[3:0];
            carry_out = temp[4];
            zero_flag = (temp == 4'b0000);
        end
    end
    
endmodule











