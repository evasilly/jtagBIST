`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2019 15:24:16
// Design Name: 
// Module Name: DebugSYS_tb
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


module DebugSYS_tb(

    );
reg TCK, TMS, TDI;
wire TDO;

reg [4:0] from_SYS_to_BSR;
wire [4:0] from_BSR_to_CL;
reg [3:0] from_CL_to_BSR;
wire [3:0] from_BSR_to_SYS;

initial begin
    TCK = 0;
    TMS = 0;
    TDI = 0;
    from_SYS_to_BSR = 5'b01010;
    from_CL_to_BSR = 4'b1001;

    /* //TEST IDCODE
    #15 TMS = 0; // idle
    #10 TMS = 1; // select_DR
    #10 TMS = 1; // select_IR
    #10 TMS = 0; // capture_IR
    #10 TMS = 0; // SHIFT
    #10 TMS = 0;
        TDI = 0;
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
    #10 TMS = 0; // shift 1
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 0; // shift
    #10 TMS = 1; // EXIT1
    #10 TMS = 1; // UPDATE
    */

/*// TEST SAMPLE_PRELOAD - INTEST/EXTEST
    #10 TMS = 0;      
    #10 TMS = 1; // select_DR
    #10 TMS = 1; // select_IR
    #10 TMS = 0; // capt_IR
    #10 TMS = 0; // SHIFT
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 1; // EXIT1_IR
        TDI = 0;
    #10 TMS = 1; // UPDATE_IR
    #10 TMS = 1; // Select DR-Scan
    #10 TMS = 0; // capt
    #10 TMS = 0; // shift
    #10 TMS = 0; // 1
        TDI = 0;
    #10 TMS = 0; // 1
        TDI = 1;
    #10 TMS = 0; // 1
        TDI = 1;
    #10 TMS = 0; // 1
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 3
        TDI = 1;
    #10 TMS = 0; // 4
        TDI = 1;
    #10 TMS = 0; // 5
        TDI = 0;
    #10 TMS = 1; // EXIT1_DR 01 | 1101
        TDI = 1;
    #10 TMS = 1; // UPDATE_DR
    #10 TMS = 1; // Select_DR
    #10 TMS = 1; // Select IR
    #10 TMS = 0; // Caprture IR
    #10 TMS = 0; // Shift_IR EXTEST
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 1; // EXIT_IR
        TDI = 0;
    #10 TMS = 1; // Update IR
    #10 TMS = 1; // Select_DR
    #10 TMS = 1; // Select IR
    #10 TMS = 0; // Caprture IR
    #10 TMS = 0; // Shift_IR INTEST
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 1; // EXIT_IR
        TDI = 0;
    #10 TMS = 1; // Update IR*/

    #15 TMS = 0; // idle
    #10 TMS = 1; // select_DR
    #10 TMS = 1; // select_IR
    #10 TMS = 0; // capt_IR
    #10 TMS = 0; // SHIFT
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 0;
        TDI = 0;
    #10 TMS = 0;
        TDI = 1;
    #10 TMS = 1; // EXIT_IR
        TDI = 0;
    #10 TMS = 1; // UPDATE_IR
    #10 TMS = 0; // IDLE

    #3000 TMS = 1; // select_DR
    #10 TMS = 0; // capture_DR
    #10 TMS = 0; // SHIFT_DR
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 0; // 2
        TDI = 0;
    #10 TMS = 0; // 2
        TDI = 1;
    #10 TMS = 1;
        TDI = 0;
    

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
    .from_BSR_to_SYS(from_BSR_to_SYS)
    );
endmodule
