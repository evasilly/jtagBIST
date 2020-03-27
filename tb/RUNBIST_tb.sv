`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 17:39:24
// Design Name: 
// Module Name: RUNBIST_tb
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


module RUNBIST_tb(

    );
    reg TCK, TMS, TDI;
    wire TDO;

    reg [4:0] from_SYS_to_BSR;
    wire [4:0] from_BSR_to_CL;
    reg [3:0] from_CL_to_BSR;
    wire [3:0] from_BSR_to_SYS;

    wire [7:0] starta;
    wire [7:0] enda;

    wire write_en;
    wire [7:0] addr;
    wire [7:0] write_data;

    wire runbist;
    wire state_idle;
    reg [13:0] signature;

initial begin
    TCK = 0;
    TMS = 0;
    TDI = 0;
    from_SYS_to_BSR = 5'b01010;
    from_CL_to_BSR = 4'b1001;
    signature = 14'b001010_1111_1010;

    #15 TMS = 0; // idle
    #10 TMS = 1; // select_DR
    #10 TMS = 1; // select_IR
    #10 TMS = 0; // capture_IR
    #10 TMS = 0; // SHIFT
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 1; // EXIT
        TDI = 0;
    #10 TMS = 1; // UPDATE

    #10 TMS = 1; // Select DR-Scan
    #10 TMS = 0; // capt
    #10 TMS = 0; // shift
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 1;
//    #10 TMS = 0;
//        TDI = 1;
//    #10 TMS = 0;
//        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 1; // EXIT1
        TDI = 1;
    #10 TMS = 1; // UPDATE
    end

    always #5 TCK = ~TCK;

DebugSYS d1(
    .TCK(TCK),
    .TMS(TMS),
    .TDI(TDI),
    .TDO(TDO),

    .from_SYS_to_BSR(from_SYS_to_BSR),
    .from_BSR_to_CL(from_BSR_to_CL),
    .from_CL_to_BSR(from_CL_to_BSR),
    .from_BSR_to_SYS(from_BSR_to_SYS),

    .start_addr(starta),
    .end_addr(enda),

    .write_en(write_en),
    .write_data(write_data),
    .addr(addr),

    .runbist(runbist),
    .state_idle(state_idle),
    .signature(signature)
    );
endmodule
