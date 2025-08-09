`timescale 1ns / 1ps



module traffic_lights_fsm(
    input wire clk,
    input wire rst,
    output reg[1:0] main_light,
    output reg[1:0] side_light
    );
    
    parameter s0_main_green = 2'b00,
              s1_main_yellow = 2'b01,
              s2_side_green = 2'b10,
              s3_side_yellow = 2'b11;
              
    reg[1:0] state, next_state;
    
    reg [3:0] timer;
    
    
    //logic for state change
    always@(posedge clk or posedge rst)begin 
        if(rst)begin
            state <= s0_main_green;
            timer <= 4'b0000;
        end
        else begin 
            if(timer == 4'b1001)begin 
                state <= next_state;
                timer = 4'b0000;
            end
            else
                timer <= timer + 1;
        end
    end
    
    //next state determining logic
    always @ (*)begin 
        case(state)
            s0_main_green: next_state = s1_main_yellow;
            s1_main_yellow: next_state = s2_side_green;
            s2_side_green: next_state = s3_side_yellow;
            s3_side_yellow: next_state = s0_main_green;
            default : next_state = s0_main_green;
        endcase
    end
    
    
    //output logic
    //00-red
    //01-yellow
    //10-green
    always @(*)begin 
        case(state) 
            s0_main_green:begin
                main_light[1:0] = 2'b10;
                side_light[1:0] = 2'b00;
            end
            s1_main_yellow:begin
                main_light[1:0] = 2'b01;
                side_light[1:0] = 2'b00;
            end
            s2_side_green:begin
                main_light[1:0] = 2'b00;
                side_light[1:0] = 2'b10;
            end
            s3_side_yellow:begin
                main_light[1:0] = 2'b00;
                side_light[1:0] = 2'b01;
            end
            default:begin
                main_light[1:0] = 2'b00;
                side_light[1:0] = 2'b00;
            end
          endcase
            
        end
    
endmodule
