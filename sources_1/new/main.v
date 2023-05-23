 `timescale 1ns / 1ps

 module Main_Module(input Clk,input Reset,input a1,input b1,input a2,input b2,output a2b_1,output a2b_2,output b2a_1,output b2a_2,output [3:0] Count_a2b_1,output [3:0] Count_a2b_2,output [3:0]Count_b2a_1,output [3:0] Count_b2a_2,output gate_open);

//uncomment the below lines and remove the outputs to generate bitstream 
// wire a2b_1,b2a_1,a2b_2,b2a_2;
// wire [3:0] Count_a2b_1,Count_a2b_2;
// wire [3:0] Count_b2a_1,Count_b2a_2;
// wire gate_open;
 
 FSM_Wheel f1(Clk,Reset,a1,b1,a2b_1,b2a_1);
 Bogey_counter f2(Clk,a2b_1,b2a_1,Reset,Count_a2b_1,Count_b2a_1);
 
 FSM_Wheel g1(Clk,Reset,a2,b2,a2b_2,b2a_2);
 Bogey_counter g2(Clk,a2b_2,b2a_2,Reset,Count_a2b_2,Count_b2a_2);

 level_crossing l1(Reset,Count_a2b_1,Count_a2b_2,Count_b2a_1,Count_b2a_2,gate_open);
 //vio_0 v1(Clk,gate_open,Count_a2b_1,Count_b2a_1,Count_a2b_2,Count_b2a_2,a2b_1,b2a_1,a2b_2,b2a_2);


 endmodule

module clk_division(input mClk,input Reset,output Clk190
    );
    
    reg [18:0] clk_div;
    always@(posedge mClk,posedge Reset)
    begin
        if(Reset)
            clk_div<=0;
        else
            clk_div<=clk_div+1;
    end
    assign Clk190=clk_div[18];
endmodule
