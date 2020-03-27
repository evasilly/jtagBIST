`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.12.2020 16:00:57
// Design Name: 
// Module Name: BIST_FSM
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

localparam [2:0] STATE_IDLE         = 3'b000;
localparam [2:0] STATE_TEST_INIT    = 3'b001;
localparam [2:0] STATE_MEM_ASK      = 3'b010;
localparam [2:0] STATE_MEM_GET      = 3'b011;
localparam [2:0] STATE_FSM_IMPACT   = 3'b100;
localparam [2:0] STATE_VERIF_RESULT = 3'b101;
localparam [2:0] STATE_WAIT_FOR_END = 3'b110;


module BIST_FSM(
    input                   clk,
    input                   runbist_en,
    input                   idle_en,
    output reg [13:0]       signature,

    output reg              clk_mem,
    input   [7:0]           mem_data,
    output reg              read_mem,
    output reg [7:0]        addr,

    input   [7:0]           start_addr,
    input   [7:0]           end_addr,

    input   [3:0]           result,
    output reg [4:0]        impact
    );

    reg [2:0] state = STATE_IDLE;
    reg [7:0] actual_addr;
    reg [3:0] ref_data;
    reg [3:0] impact_data;
    reg [13:0] actual_sig;
    wire enabled;
    reg failed, done;

    assign enabled = runbist_en && idle_en;
    assign signature = actual_sig;

    always@(posedge clk)
    begin
        
        case (state)

            STATE_IDLE: begin
                if (enabled) begin
                    state <= STATE_TEST_INIT;
                end
            end

            STATE_TEST_INIT: begin
                if (enabled) begin
                    state <= STATE_MEM_ASK;
                end else begin
                    state <= STATE_IDLE;
                end
            end

            STATE_MEM_ASK: begin
                if (enabled && !done) begin
                    state <= STATE_MEM_GET;
                end else if (done && enabled) begin
                    state <= STATE_WAIT_FOR_END;
                end else begin
                    state <= STATE_IDLE;
                end
            end

            STATE_MEM_GET: begin
                if (enabled) begin
                    state <= STATE_FSM_IMPACT;
                end else begin
                    state <= STATE_IDLE;
                end
            end

            STATE_FSM_IMPACT: begin
                if (enabled) begin
                    state <= STATE_VERIF_RESULT;
                end else begin
                    state <= STATE_IDLE;
                end
            end

            STATE_VERIF_RESULT: begin
                if (enabled && !failed) begin
                    state <= STATE_MEM_ASK;
                end else if (failed && enabled) begin
                    state <= STATE_WAIT_FOR_END;
                end else begin
                    state <= STATE_IDLE;
                end
            end

            STATE_WAIT_FOR_END: begin
                if (!enabled) begin
                    state <= STATE_IDLE;
                end
            end

        endcase
    end

always@(negedge clk)
    begin

        case (state)

            STATE_IDLE: begin
                clk_mem     <= 1'b0;
                read_mem    <= 1'b0;
                addr        <= 8'b00000000;
                impact      <= 5'b00000;
                done        <= 1'b0;
                failed      <= 1'b0;
            end

            STATE_TEST_INIT: begin
                actual_addr <= start_addr;
                actual_sig  <= 14'b0_0_0000_0000_0000;
            end

            STATE_MEM_ASK: begin
                if (actual_addr > end_addr) begin
                    done            <= 1'b1;
                    actual_sig[12]  <= 1'b0;
                end else begin
                    addr            <= actual_addr;
                    read_mem        <= 1'b1;
                    clk_mem         <= 1'b1;
                end
            end

            STATE_MEM_GET: begin
                clk_mem             <= 1'b0;
                read_mem            <= 1'b0;
                actual_addr         <= actual_addr + 1'b1;

                impact[4]           <= 1'b0;
                impact_data         <= mem_data[7:4]; 
                impact[3:0]         <= mem_data[7:4]; // sic
                ref_data            <= mem_data[3:0];
            end

            STATE_FSM_IMPACT: begin
                // impact[3:0] = impact_data;  // sic
                impact[4]   <= 1'b1;
            end

            STATE_VERIF_RESULT: begin
                impact[4] <= 1'b0;
                if (result != ref_data) begin
                    failed      <= 1'b1;
                    actual_sig  <= {1'b1, (actual_addr - 1'b1) != end_addr, impact_data, ref_data, result};
                end else begin
                    actual_sig  <= {1'b0, (actual_addr - 1'b1) != end_addr, 12'b0000_0000_0000};
                end
            end

            STATE_WAIT_FOR_END: begin
                read_mem    <= 1'b0;
                clk_mem     <= 1'b0;
            end

        endcase

    end

endmodule
