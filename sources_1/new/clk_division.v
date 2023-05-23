`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2021 12:59:04
// Design Name: 
// Module Name: clk_division
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
