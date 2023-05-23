`timescale 1ns / 1ps

module level_crossing(input Reset,input [3:0]Count_a2b_1,input [3:0]Count_a2b_2,input [3:0]Count_b2a_1,input [3:0] Count_b2a_2,output reg gate_open);

parameter num_bogeys = 4'b0100;//value can be read from a file

always@(*)
begin
    if(Reset)
        gate_open<=1'b1;
    else
    begin
        if(Count_a2b_1==num_bogeys)//the train has crossed counter 1
        begin
            if(Count_a2b_2==num_bogeys)//the train has crossed counter 2
            gate_open<=1'b1;
            else
            gate_open<=1'b0;
        end
        else if(Count_b2a_2==num_bogeys)//the train has crossed counter 2
        begin
            if(Count_b2a_1==num_bogeys)//the train ahs crossed counter 1
            gate_open<=1'b1;
            else
            gate_open<=1'b0;
        end
        else
        gate_open<=1'b1;
    end
end
endmodule