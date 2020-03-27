`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.12.2019 17:08:01
// Design Name: 
// Module Name: OnboardTop
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


module OnboardTop(
    input   [15:0]  SW,
    output  [15:0]  LED,

    input           JB_TCK,
    input           JB_TMS,
    input           JB_TDI,
    output          JB_TDO,

    output          JBM_TCK,
    output          JBM_TMS,
    output          JBM_TDI,
    output          JBM_TDO,

    output          JA_1,
    output          JA_2,
    output          JA_3,
    output          JA_4,
    output          JA_5,

    output          JC_1,
    output          JC_2,
    output          JC_3,
    output          JC_4
    );

    wire TCK, TMS, TDI, TDO;

    wire [4:0] from_SYS_to_BSR;
    wire [4:0] from_BSR_to_CL;
    wire [3:0] from_CL_to_BSR;
    wire [3:0] from_BSR_to_SYS;

    wire [7:0] start_addr;
    wire [7:0] end_addr;
    wire write_en;
    wire [7:0] write_data;
    wire [7:0] addr_debug;
    wire [7:0] addr_bistfsm;
    wire [7:0] addr_result;
    wire runbist;
    wire state_idle;
    wire [13:0] signature;
    wire mem_reset;
    wire [7:0] read_data;
    wire read_en;
    wire clk_mem;

    wire [3:0] from_CL_to_BISTFSM;
    wire [4:0] from_BISTFSM_to_CL;
    wire [4:0] result_to_CL;
    wire [3:0] result_from_CL;

    assign from_SYS_to_BSR = SW[15:11];
    //assign LED[15:12] = from_BSR_to_SYS;
    assign LED[15:12] = result_from_CL; // fix
    assign LED[4:0] = from_BISTFSM_to_CL; // delete

    assign JA_1 = result_to_CL[4];
    assign JA_2 = result_to_CL[3];
    assign JA_3 = result_to_CL[2];
    assign JA_4 = result_to_CL[1];
    assign JA_5 = result_to_CL[0];

    assign JC_1 = result_from_CL[3];
    assign JC_2 = result_from_CL[2];
    assign JC_3 = result_from_CL[1];
    assign JC_4 = result_from_CL[0];

    assign TDI = JB_TDI;
    assign TMS = JB_TMS;
    assign TCK = JB_TCK;
    assign JB_TDO = TDO;

    assign JBM_TCK = JB_TCK;
    assign JBM_TDI = JB_TDI;
    assign JBM_TMS = JB_TMS;
    assign JBM_TDO = TDO;

    // runbist connections
    assign addr_result = runbist ? addr_bistfsm : addr_debug;
    assign result_to_CL = runbist ? from_BISTFSM_to_CL : from_BSR_to_CL;
    assign from_CL_to_BSR = runbist ? 4'b0000: result_from_CL;
    assign from_CL_to_BISTFSM = runbist ? result_from_CL : 4'b0000;

DebugSYS debugsys1(
    .TCK(TCK),
    .TMS(TMS),
    .TDI(TDI),
    .TDO(TDO),

    .from_SYS_to_BSR(from_SYS_to_BSR),
    .from_BSR_to_CL(from_BSR_to_CL),
    .from_CL_to_BSR(from_CL_to_BSR),
    .from_BSR_to_SYS(from_BSR_to_SYS),

    .start_addr(start_addr),
    .end_addr(end_addr),

    .write_en(write_en),
    .write_data(write_data),
    .addr(addr_debug),

    .runbist(runbist),
    .state_idle(state_idle),
    .signature(signature),

    .mem_reset(mem_reset)
    );

TMemory tmem1(
    .clk(TCK),
    .rst(mem_reset),
    
    .write_en(write_en),
    .read_en(read_en),

    .addr(addr_result),
    .write_data(write_data),

    .read_data(read_data)
    );

BIST_FSM bistfsm1(
    .clk(TCK),
    .runbist_en(runbist),
    .idle_en(state_idle),
    .signature(signature),

    .clk_mem(clk_mem),
    .mem_data(read_data),
    .read_mem(read_en),
    .addr(addr_bistfsm),

    .start_addr(start_addr),
    .end_addr(end_addr),

    .result(from_CL_to_BISTFSM),
    .impact(from_BISTFSM_to_CL)
    );

Core_FSM cfsm1(
    .clk(result_to_CL[4]),
    .impact(result_to_CL[3:0]),

    .result(result_from_CL)
    );

//CoreLogic corelogic1(
//    .A(from_BSR_to_CL[4:3]),
//    .B(from_BSR_to_CL[2:1]),
//    .op_code(from_BSR_to_CL[0]),
//    .result(from_CL_to_BSR)
//    );
endmodule
