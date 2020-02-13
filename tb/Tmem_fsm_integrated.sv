`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2020 20:55:29
// Design Name: 
// Module Name: Tmem_fsm_integrated
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


module Tmem_fsm_integrated(

    );

    reg clk, rst, write_en, runbist_en, idle_en;
    reg [7:0] write_data;
    reg [7:0] start_addr;
    reg [7:0] end_addr;
    wire [7:0] read_data;
    wire [13:0] signature;

    wire read_en;
    wire [7:0] addr;
    wire [4:0] impact;
    wire [3:0] result;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        write_en = 1'b0;
        runbist_en = 1'b0;
        idle_en = 1'b0;

        #10 rst = 1'b0;

        #50 runbist_en = 1'b1;
            idle_en = 1'b1;
            start_addr = 8'h00;
            end_addr = 8'h02;

        #500 runbist_en = 1'b0;
            idle_en = 1'b0;
    end

    always #5 clk = ~clk;


Core_FSM cfsm1(
    .clk(impact[4]),
    .impact(impact),

    .result(result)
    );

TMemory tmem1(
    .clk(clk),
    .rst(rst),
    
    .write_en(write_en),
    .read_en(read_en),

    .addr(addr),
    .write_data(write_data),

    .read_data(read_data)
    );

BIST_FSM bfsm1(
    .clk(clk),
    .runbist_en(runbist_en),
    .idle_en(idle_en),
    .signature(signature),

    .mem_data(read_data),
    .read_mem(read_en),
    .addr(addr),

    .start_addr(start_addr),
    .end_addr(end_addr),

    .result(result),
    .impact(impact)
    );
endmodule
