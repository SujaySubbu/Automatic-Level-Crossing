`timescale 1ns / 1ps

module Bogey_counter(input Clk,input a2b,input b2a,input Reset,output reg [3:0] Count_a2b,output reg[3:0] Count_b2a);

reg [3:0]Count_a;//number of wheels that have moved from a to b
reg [3:0]Count_b;//number of wheels that have moved from b to a
parameter num_wheels = 4'b0100;//number of wheels on the bogey

    always@(posedge Clk,posedge Reset)
    begin
        if(Reset)
        begin
            Count_a=4'b0000;
            Count_b=4'b0000;
            Count_a2b=4'b0000;
            Count_b2a=4'b0000;
        end
        else if(a2b)//the wheel has moved from a to b
        begin
            if(Count_b!=4'b0000)//if not 0, it implies that the wheel had initially moved from b to a but now the train has reversed direction and moves from a to b
            Count_b=Count_b-4'b0001;
            else
            begin
            Count_a=Count_a+4'b0001;//the wheel has moved from a to b without any direction change
                if(Count_a==num_wheels)
                begin
                    if(Count_b2a!=4'b0000)
                        Count_b2a=Count_b2a-4'b0001;//the bogey had initially moved from b to a but now the train has reversed direction and moves from a to b
                    Count_a2b=Count_a2b+4'b0001;
                    Count_a=4'b0000;
                    Count_b=4'b0000;
                end
            end
        end
        else if(b2a)//the wheel has moved from b to a
        begin
            if(Count_a!=4'b0000)//if not 0, it implies that the wheel had initially moved from a to b but now the train has reversed direction and moves from b to a
                Count_a=Count_a-4'b0001;
            else
            begin
                Count_b=Count_b+4'b0001;//the wheel has moved from b to a without any direction change
                if(Count_b==num_wheels)
                begin
                    if(Count_a2b!=4'b0000)
                        Count_a2b=Count_a2b-4'b0001;//the bogey had initially moved from a to b but now the train has reversed direction and moves from b to a
                    Count_b2a=Count_b2a+4'b0001;
                    Count_a=4'b0000;
                    Count_b=4'b0000;
                end
            end
        end
    end
                
endmodule

