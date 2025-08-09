`timescale 1ns / 1ps



module traffic_lights_fsm_tb();
    reg clk,rst;
    wire[1:0] main, side;
    
    traffic_lights_fsm uut(clk, rst, main, side);
    always #10 clk=~clk;
    initial begin
        clk=0;
        rst = 1;
        #20;
        rst = 0;
        #1000;
    end
        
endmodule
