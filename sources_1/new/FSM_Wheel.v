`timescale 1ns / 1ps

module FSM_Wheel(input Clk,input Reset,input a,input b,output reg a2b, output reg b2a);
    reg [3:0] present_state;reg [3:0] next_state;
    
    parameter S0 = 4'b0000,S1 = 4'b0001,S2 = 4'b0010,S3 = 4'b0011,S4 = 4'b0100;
    parameter Q1 = 4'b0101,Q2 = 4'b0110,Q3 = 4'b0111,Q4 = 4'b1000;

    //checks if wheel has passed and returns a pulse output in the appropriate output register
    //state register
    always@(posedge Clk, posedge Reset)
    begin
        if(Reset)
            present_state<=S0;
        else
            present_state<=next_state;
    end
    
    always@(present_state,a,b)
    begin
        case(present_state)
            S0:next_state<=(a & !b)?S1:(!a & b)?Q1:S0;
            S1:next_state<=(a & b)?S2:(!a & !b)?S0:S1;
            S2:next_state<=(!a & b)?S3:(a & !b)?S1:S2;
            S3:next_state<=(!a & !b)?S4:(a & b)?S2:S3;
            S4:next_state<=(a & !b)?S1:(!a & b)?Q1:S0;
            
            Q1:next_state<=(a & b)?Q2:(!a & !b)?S0:Q1;
            Q2:next_state<=(a & !b)?Q3:(!a & b)?Q1:Q2;
            Q3:next_state<=(!a & !b)?Q4:(a & b)?Q2:Q3;
            Q4:next_state<=(a & !b)?S1:(!a & b)?Q1:S0;    
            default: next_state<=S0;
        endcase
    end    
    //output logic
    always@(present_state)
        begin
        if(present_state==Q4)
            begin
                a2b<=1'b0;b2a<=1'b1;//the wheel has moved completely from b to a
            end
        else if(present_state==S4)
            begin
                a2b<=1'b1;b2a<=1'b0;//the wheel has moved completely from a to b
            end
        else
        begin
            a2b<=1'b0;b2a<=1'b0;
        end
    end 
endmodule
