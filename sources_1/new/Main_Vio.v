`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.11.2022 10:11:07
// Design Name: 
// Module Name: Main_Vio
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Main_Vio(
    input Clk,
  //  output a2b_1_x,
    //output a2b_2_x,
    //output b2a_1_x,
    //output b2a_2_x,
   // output [3:0] Count_a2b_1_x,
    //output [3:0] Count_a2b_2_x,
    //output [3:0] Count_b2a_1_x,
    //output [3:0] Count_b2a_2_x,
    output gate_open_x
    );
wire Reset;
wire a1;
wire a2;
wire b1;
wire b2;    
wire a2b_1;
wire a2b_2;
wire b2a_1;
wire b2a_2;
wire [3:0] Count_a2b_1;
wire [3:0] Count_a2b_2;
wire [3:0] Count_b2a_1;
wire [3:0] Count_b2a_1;
wire gate_open;

Main_Module m1(Clk,Reset,a1,b1,a2,b2,a2b_1,a2b_2,b2a_1,b2a_2, Count_a2b_1,Count_a2b_2,Count_b2a_1,Count_b2a_2,gate_open);
    
vio_0 V1(
Clk,
a2b_1,a2b_2,b2a_1,b2a_2,Count_a2b_1,Count_a2b_2,Count_b2a_1,Count_b2a_2,gate_open,
Reset,
a1,
b1,
a2,
b2
);
//assign a2b_1_x = a2b_1;
//assign a2b_2_x = a2b_2;
  //  assign b2a_1_x = b2a_1;
    //assign b2a_2_x = b2a_2;
    //assign Count_a2b_1_x = Count_a2b_1;
    //assign Count_a2b_2_x = Count_a2b_2;
   // assign Count_b2a_1_x = Count_b2a_1;
   // assign Count_b2a_2_x = Count_b2a_2;
    assign gate_open_x = gate_open;

endmodule
