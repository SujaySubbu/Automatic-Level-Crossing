`timescale 1ns / 1ps

module test_main();

reg Clk;
reg Reset;
reg a1,a2;
reg b1,b2;

wire a2b_1,a2b_2,b2a_1,b2a_2;
wire [3:0] Count_a2b_1;
wire [3:0] Count_a2b_2;
wire [3:0] Count_b2a_1;
wire [3:0] Count_b2a_2;
wire gate_open;
integer i;
Main_Module m1(Clk,Reset,a1,b1,a2,b2,a2b_1,a2b_2,b2a_1,b2a_2,Count_a2b_1,Count_a2b_2,Count_b2a_1,Count_b2a_2,gate_open);
initial 
    begin
        Clk = 1'b0;
        repeat(100000)
        #5 Clk = ~Clk;
    $finish;
    end

initial 
    begin
    Reset = 1'b0;
    #1 Reset = 1'b1;
    #1 Reset = 1'b0;
    #1900;
    Reset = 1'b1;
    #1;
    Reset = 1'b0;
    #2400;
    Reset = 1'b1;
    #1;
    Reset = 1'b0;
    #1900;
    Reset = 1'b1;
    #1;
    Reset = 1'b0;
    end

initial
    begin
        a1 = 1'b0;
        b1 = 1'b0;
        a2 = 1'b0;
        b2 = 1'b0;
        //a to b 
        #10;
        for(i=0;i<16;i=i+1)
        begin
            a1 = 1'b0;
            b1 = 1'b0;
            #10;
            a1 = 1'b1;
            b1 = 1'b0;
            #10;
            a1 = 1'b1;
            b1 = 1'b1;
            #10;
            a1 = 1'b0;
            b1 = 1'b1;
            #10;
        end
        a1 = 1'b0;
        b1 = 1'b0;
        #500;
        for(i=0;i<16;i=i+1)
        begin
            a2 = 1'b0;
            b2 = 1'b0;
            #10;
            a2 = 1'b1;
            b2 = 1'b0;
            #10;
            a2 = 1'b1;
            b2 = 1'b1;
            #10;
            a2 = 1'b0;
            b2 = 1'b1;
            #10;
        end
        a2 = 1'b0;
        b2 = 1'b0;
        #500;
        //b to a
        for(i=0;i<16;i=i+1)
        begin
            a2 = 1'b0;
            b2 = 1'b0;
            #10;
            a2 = 1'b0;
            b2 = 1'b1;
            #10;
            a2 = 1'b1;
            b2 = 1'b1;
            #10;
            a2 = 1'b1;
            b2 = 1'b0;
            #10;
        end
        a2 = 1'b0;
        b2 = 1'b0;
        #500;
        for(i=0;i<16;i=i+1)
        begin
            a1 = 1'b0;
            b1 = 1'b0;
            #10;
            a1 = 1'b0;
            b1 = 1'b1;
            #10;
            a1 = 1'b1;
            b1 = 1'b1;
            #10;
            a1 = 1'b1;
            b1 = 1'b0;
            #10;
        end
        a1 = 1'b0;
        b1 = 1'b0;
        #500;
        //corner case
        for(i=0;i<16;i=i+1)
        begin
            a1 = 1'b0;
            b1 = 1'b0;
            #10;
            a1 = 1'b1;
            b1 = 1'b0;
            #10;
            a1 = 1'b1;
            b1 = 1'b1;
            #10;
            a1 = 1'b0;
            b1 = 1'b1;
            #10;
        end
        a1 = 1'b0;
        b1 = 1'b0;
        #10;
        for(i=0;i<16;i=i+1)
        begin
            a1 = 1'b0;
            b1 = 1'b0;
            #10;
            a1 = 1'b0;
            b1 = 1'b1;
            #10;
            a1 = 1'b1;
            b1 = 1'b1;
            #10;
            a1 = 1'b1;
            b1 = 1'b0;
            #10;
        end
        a1 = 1'b0;
        b1 = 1'b0;
        #500;
        //mirror corner case
        for(i=0;i<16;i=i+1)
        begin
            a2 = 1'b0;
            b2 = 1'b0;
            #10;
            a2 = 1'b0;
            b2 = 1'b1;
            #10;
            a2 = 1'b1;
            b2 = 1'b1;
            #10;
            a2 = 1'b1;
            b2 = 1'b0;
            #10;
        end
        a2 = 1'b0;
        b2 = 1'b0;
        #10;
        for(i=0;i<16;i=i+1)
        begin
            a2 = 1'b0;
            b2 = 1'b0;
            #10;
            a2 = 1'b1;
            b2 = 1'b0;
            #10;
            a2 = 1'b1;
            b2 = 1'b1;
            #10;
            a2 = 1'b0;
            b2 = 1'b1;
            #10;
        end
        a2 = 1'b0;
        b2 = 1'b0;
    end
endmodule
