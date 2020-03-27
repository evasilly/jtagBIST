`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 02:55:37
// Design Name: 
// Module Name: bist_fsm_tb
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


module bist_fsm_tb(

    );

    reg clk, runbist_en, idle_en;

    wire [13:0] signature;
    reg [7:0] mem_data, start_addr, end_addr;

    reg [3:0] result;
    wire [4:0] impact;

    wire read_mem;

    wire [7:0] addr;

    initial begin
        clk = 0;
        runbist_en = 0;
        idle_en = 0;
        mem_data = 0;
        start_addr = 3;
        end_addr = 10;
        result = 0;

        #10
            runbist_en = 1;
            idle_en = 1;
        
        #20 mem_data = 8'hAB;
        
        #10 result = 4'hC;

        #50 idle_en = 0;
        
    end

    always #4 clk = ~clk;

BIST_FSM bfsm1(
    .clk(clk),
    .runbist_en(runbist_en),
    .idle_en(idle_en),
    .signature(signature),

    .mem_data(mem_data),
    .read_mem(read_mem),
    .addr(addr),

    .start_addr(start_addr),
    .end_addr(end_addr),

    .result(result),
    .impact(impact)
    );
endmodule
