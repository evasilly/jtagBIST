`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2020 18:23:20
// Design Name: 
// Module Name: Core_FSM
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


module Core_FSM(
    input           clk,
    input [3:0]     impact,

    output [3:0]    result
    );

    reg [3:0] state = 4'b0000;
    assign result = state;

    always@(posedge clk)
    begin

        case (state)
            4'b0000: begin
                casex(impact)
                    4'b000x: state = 4'b0010;
                    4'b1000: state = 4'b0110;
                    4'b1x01: state = 4'b1010;
                    4'b1111: state = 4'b1101;
                endcase
            end
            4'b0001: begin
                casex(impact)
                    4'b1111: state = 4'b0000;
                    4'b1011: state = 4'b0011;
                    4'b1100: state = 4'b1000;
                    4'b0010: state = 4'b1011;
                endcase
            end
            4'b0010: begin
                casex(impact)
                    4'b1011: state = 4'b0001;
                    4'b1111: state = 4'b0101;
                    4'b0110: state = 4'b0111;
                    4'b00x0: state = 4'b1001;
                    4'b1100: state = 4'b1110;
                endcase
            end
            4'b0011: begin
                casex(impact)
                    4'b1010: state = 4'b0100;
                    4'b0110: state = 4'b1111;
                endcase
            end
            4'b0100: begin
                casex(impact)
                    4'b1111: state = 4'b0001;
                    4'b0001: state = 4'b0111;
                    4'b0101: state = 4'b1100;
                endcase
            end
            4'b0101: begin
                casex(impact)
                    4'b1100: state = 4'b0000;
                    4'b0011: state = 4'b0010;
                    4'b1111: state = 4'b0100;
                    4'b0010: state = 4'b1000;
                endcase
            end
            4'b0110: begin
                casex(impact)
                    4'b0001: state = 4'b0001;
                    4'b0010: state = 4'b0101;
                    4'b0011: state = 4'b1000;
                    4'b1001: state = 4'b1011;
                    4'b1111: state = 4'b1110;
                    4'b1110: state = 4'b1111;
                endcase
            end
            4'b0111: begin
                casex(impact)
                    4'b0000: state = 4'b0000;
                    4'b11x0: state = 4'b0010;
                    4'b0101: state = 4'b0101;
                    4'b0011: state = 4'b1010;
                endcase
            end
            4'b1000: begin
                casex(impact)
                    4'b1010: state = 4'b0001;
                    4'b1101: state = 4'b0011;
                    4'b0011: state = 4'b0111;
                    4'b1011: state = 4'b1011;
                    4'b0010: state = 4'b1101;
                endcase
            end
            4'b1001: begin
                casex(impact)
                    4'b0000: state = 4'b0100;
                    4'b0001: state = 4'b0110;
                    4'b1110: state = 4'b1100;
                    4'b1010: state = 4'b1110;
                endcase
            end
            4'b1010: begin
                casex(impact)
                    4'b0011: state = 4'b0010;
                    4'b1111: state = 4'b0101;
                    4'b1010: state = 4'b1000;
                    4'b0001: state = 4'b1101;
                endcase
            end
            4'b1011: begin
                casex(impact)
                    4'b1010: state = 4'b0001;
                    4'b0101: state = 4'b0100;
                    4'b1101: state = 4'b1000;
                    4'b1001: state = 4'b1110;
                endcase
            end
            4'b1100: begin
                casex(impact)
                    4'b1110: state = 4'b0011;
                    4'b1001: state = 4'b0110;
                    4'b1010: state = 4'b1001;
                    4'b1111: state = 4'b1011;
                    4'b0000: state = 4'b1110;
                endcase
            end
            4'b1101: begin
                casex(impact)
                    4'b0010: state = 4'b0000;
                    4'b0101: state = 4'b0010;
                    4'b1001: state = 4'b0011;
                    4'b1110: state = 4'b0101;
                    4'b1111: state = 4'b1010;
                endcase
            end
            4'b1110: begin
                casex(impact)
                    4'b1111: state = 4'b0001;
                    4'b1101: state = 4'b0100;
                    4'b11x0: state = 4'b0111;
                endcase
            end
            4'b1111: begin
                casex(impact)
                    4'b1100: state = 4'b0011;
                    4'b1010: state = 4'b0110;
                    4'b0000: state = 4'b1010;
                    4'b01xx: state = 4'b1100;
                endcase
            end
        endcase
        
    end
endmodule
