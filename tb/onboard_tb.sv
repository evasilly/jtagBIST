`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2020 21:54:02
// Design Name: 
// Module Name: onboard_tb
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


module onboard_tb(

    );

reg [15:0] SW;
wire [15:0] LED;

reg TCK, TMS, TDI;
wire TDO;

initial begin
        TCK = 0;
        TMS = 1;
        TDI = 0;
        SW = 16'h0000;

/*        #10 TMS = 0; // IDLE
        #10 TMS = 1; // SELECT_DR
        #10 TMS = 1; // SELECT_IR
        #10 TMS = 0; // CAPTURE_IR
        #10 TMS = 0; // SHIFT_IR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 1; // EXIT1_IR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // UPDATE_IR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 0; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 0;
            TDI = 0; // SHIFT 4
        #10 TMS = 0;
            TDI = 0; // SHIFT 5
        #10 TMS = 0;
            TDI = 0; // SHIFT 6
        #10 TMS = 0;
            TDI = 0; // SHIFT 7
        #10 TMS = 0;
            TDI = 0; // SHIFT 8
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 9
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 1; // Select_DR
        #10 TMS = 1; // Select_R
        #10 TMS = 0; // Caprture_IR
        #10 TMS = 0; // Shift_IR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 1; // EXIT_IR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // Update_IR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 0;
            TDI = 1; // SHIFT 4
        #10 TMS = 1; // EXIT1_DR
            TDI = 1; // SHIFT 5
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 0; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 0;
            TDI = 1; // SHIFT 4
        #10 TMS = 1; // EXIT1_DR
            TDI = 1; // SHIFT 5
        #10 TMS = 1; // UPDATE_DR*/

        
        /* LOAD 3, RUNTEST

        #10 TMS = 0; // IDLE
        #10 TMS = 1; // SELECT_DR
        #10 TMS = 1; // SELECT_IR
        #10 TMS = 0; // CAPTURE_IR
        #10 TMS = 0; // SHIFT_IR
        #10 TMS = 0;
            TDI = 0; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 1; // EXIT1_IR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // UPDATE_IR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 0; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 0;
            TDI = 0; // SHIFT 4
        #10 TMS = 0;
            TDI = 0; // SHIFT 5
        #10 TMS = 0;
            TDI = 0; // SHIFT 6
        #10 TMS = 0;
            TDI = 0; // SHIFT 7
        #10 TMS = 0;
            TDI = 1; // SHIFT 8
        #10 TMS = 0;
            TDI = 0; // SHIFT 9
        #10 TMS = 0;
            TDI = 0; // SHIFT 10
        #10 TMS = 0;
            TDI = 0; // SHIFT 11
        #10 TMS = 0;
            TDI = 0; // SHIFT 12
        #10 TMS = 0;
            TDI = 0; // SHIFT 13
        #10 TMS = 0;
            TDI = 0; // SHIFT 14
        #10 TMS = 0;
            TDI = 0; // SHIFT 15
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 16
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 0;
            TDI = 1; // SHIFT 4
        #10 TMS = 0;
            TDI = 1; // SHIFT 5
        #10 TMS = 0;
            TDI = 0; // SHIFT 6
        #10 TMS = 0;
            TDI = 0; // SHIFT 7
        #10 TMS = 0;
            TDI = 1; // SHIFT 8
        #10 TMS = 0;
            TDI = 1; // SHIFT 9
        #10 TMS = 0;
            TDI = 0; // SHIFT 10
        #10 TMS = 0;
            TDI = 0; // SHIFT 11
        #10 TMS = 0;
            TDI = 0; // SHIFT 12
        #10 TMS = 0;
            TDI = 0; // SHIFT 13
        #10 TMS = 0;
            TDI = 0; // SHIFT 14
        #10 TMS = 0;
            TDI = 0; // SHIFT 15
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 16
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 0;
            TDI = 0; // SHIFT 4
        #10 TMS = 0;
            TDI = 0; // SHIFT 5
        #10 TMS = 0;
            TDI = 1; // SHIFT 6
        #10 TMS = 0;
            TDI = 0; // SHIFT 7
        #10 TMS = 0;
            TDI = 1; // SHIFT 8
        #10 TMS = 0;
            TDI = 0; // SHIFT 9
        #10 TMS = 0;
            TDI = 1; // SHIFT 10
        #10 TMS = 0;
            TDI = 0; // SHIFT 11
        #10 TMS = 0;
            TDI = 0; // SHIFT 12
        #10 TMS = 0;
            TDI = 0; // SHIFT 13
        #10 TMS = 0;
            TDI = 0; // SHIFT 14
        #10 TMS = 0;
            TDI = 0; // SHIFT 15
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 16
        #10 TMS = 1; // UPDATE_DR

        #10 TMS = 0; // IDLE
        #10 TMS = 1; // SELECT_DR
        #10 TMS = 1; // SELECT_IR
        #10 TMS = 0; // CAPTURE_IR
        #10 TMS = 0; // SHIFT_IR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 1; // EXIT1_IR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // UPDATE_IR

        #10 TMS = 1; // SELECT_DR
        #10 TMS = 0; // CAPTURE_DR
        #10 TMS = 0; // SHIFT_DR
        #10 TMS = 0;
            TDI = 0; // SHIFT 1
        #10 TMS = 0;
            TDI = 1; // SHIFT 2
        #10 TMS = 0;
            TDI = 0; // SHIFT 3
        #10 TMS = 0;
            TDI = 0; // SHIFT 4
        #10 TMS = 0;
            TDI = 0; // SHIFT 5
        #10 TMS = 0;
            TDI = 0; // SHIFT 6
        #10 TMS = 0;
            TDI = 0; // SHIFT 7
        #10 TMS = 0;
            TDI = 0; // SHIFT 8
        #10 TMS = 0;
            TDI = 0; // SHIFT 9
        #10 TMS = 0;
            TDI = 0; // SHIFT 10
        #10 TMS = 0;
            TDI = 0; // SHIFT 11
        #10 TMS = 0;
            TDI = 0; // SHIFT 12
        #10 TMS = 0;
            TDI = 0; // SHIFT 13
        #10 TMS = 0;
            TDI = 0; // SHIFT 14
        #10 TMS = 0;
            TDI = 0; // SHIFT 15
        #10 TMS = 1; // EXIT1_DR
            TDI = 0; // SHIFT 16
        #10 TMS = 1; // UPDATE_DR


        #10 TMS = 0; // IDLE
        #10 TMS = 1; // SELECT_DR
        #10 TMS = 1; // SELECT_IR
        #10 TMS = 0; // CAPTURE_IR
        #10 TMS = 0; // SHIFT_IR
        #10 TMS = 0;
            TDI = 1; // SHIFT 1
        #10 TMS = 0;
            TDI = 0; // SHIFT 2
        #10 TMS = 0;
            TDI = 1; // SHIFT 3
        #10 TMS = 1; // EXIT1_IR
            TDI = 0; // SHIFT 4
        #10 TMS = 1; // UPDATE_IR
        #10 TMS = 0; // IDLE

        #1000 TMS = 1;
        LOAD 3, RUNTEST */ 

    #115 TMS = 0; // idle
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

    #5000 TMS = 1; // select_DR
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

always #5 TCK = ~ TCK;

OnboardTop onbtop1(
    .SW(SW),
    .LED(LED),

    .JB_TCK(TCK),
    .JB_TMS(TMS),
    .JB_TDI(TDI),
    .JB_TDO(TDO)
    );

endmodule
