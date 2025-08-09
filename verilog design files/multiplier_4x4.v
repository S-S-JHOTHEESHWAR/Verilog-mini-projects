`timescale 1ns / 1ps

/*
4x4 multiplier 
*/
module half_adder(
    input wire a,
    input wire b,
    output wire s,
    output wire c_out);
    
    assign s = a ^ b;
    assign c_out = a & b;
    
endmodule

module full_adder(
    input wire a,
    input wire b,
    input wire c_in,
    output wire s,
    output wire c_out);
    
    assign s = a ^ b ^ c_in;
    assign c_out = a&b | b&c_in | c_in&a;
endmodule


module multiplier_4x4(
    input wire[3:0] a,
    input wire[3:0] b,
    output wire[7:0] p
    );
    
    wire[15:0] data;
    assign data[0] = a[0] & b[0];
    assign data[1] = a[1] & b[0];
    assign data[2] = a[2] & b[0];
    assign data[3] = a[3] & b[0];
    
    assign data[4] = a[0] & b[1];
    assign data[5] = a[1] & b[1];
    assign data[6] = a[2] & b[1];
    assign data[7] = a[3] & b[1];
    
    assign data[8] = a[0] & b[2];
    assign data[9] = a[1] & b[2];
    assign data[10] = a[2] & b[2];
    assign data[11] = a[3] & b[2];
    
    assign data[12] = a[0] & b[3];
    assign data[13] = a[1] & b[3];
    assign data[14] = a[2] & b[3];
    assign data[15] = a[3] & b[3];
    
    assign p[0] = data[0];
    
    wire x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13;
    
    half_adder a0 (data[1] ,data[4], p[1], x1);
    
    full_adder a1 (x1,data[2],data[5],x2,x3);
    half_adder a2 (x2,x3,p[2],x4);
    
    full_adder a3 (data[3], x4, data[6], x5, x6);
    full_adder a4 (x5, x6, data[9], x7, x8);
    full_adder a5 (x7, x8, data[12], p[3], x9);
    
    full_adder a6 (x9, data[7], data[10], x10, x11); 
    full_adder a7 (x10, x11, data[13], p[4], x12);
    
    full_adder a8 (x12, data[11], data[14], p[5], x13);
    
    half_adder a9 (x13, data[15], p[6], p[7]);
endmodule
