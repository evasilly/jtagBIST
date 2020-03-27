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

    output reg [3:0]    result
    );

    reg [3:0] state = 4'b0000;
    reg [3:0] nextstate = 4'b0000;

    always@(posedge clk)
    begin
        state <= nextstate;
        result <= nextstate;
    end

    always@(state or impact)
    begin

        case (state)
            4'b0000: begin
                case(impact)
                    4'b0000: begin nextstate = 4'b0010; end
                    4'b1000: begin nextstate = 4'b0110; end
                    4'b1001: begin nextstate = 4'b1010; end
                    4'b1111: begin nextstate = 4'b1101; end
                endcase
            end
            4'b0001: begin
                case(impact)
                    4'b1111: begin nextstate = 4'b0000; end
                    4'b1011: begin nextstate = 4'b0011; end
                    4'b1100: begin nextstate = 4'b1000; end
                    4'b0010: begin nextstate = 4'b1011; end
                endcase
            end
            4'b0010: begin
                case(impact)
                    4'b1011: begin nextstate = 4'b0001; end
                    4'b1111: begin nextstate = 4'b0101; end
                    4'b0110: begin nextstate = 4'b0111; end
                    4'b0000: begin nextstate = 4'b1001; end
                    4'b1100: begin nextstate = 4'b1110; end
                endcase
            end
            4'b0011: begin
                case(impact)
                    4'b1010: begin nextstate = 4'b0100; end
                    4'b0110: begin nextstate = 4'b1111; end
                endcase
            end
            4'b0100: begin
                case(impact)
                    4'b1111: begin nextstate = 4'b0001; end
                    4'b0001: begin nextstate = 4'b0111; end
                    4'b0101: begin nextstate = 4'b1100; end
                endcase
            end
            4'b0101: begin
                case(impact)
                    4'b1100: begin nextstate = 4'b0000; end
                    4'b0011: begin nextstate = 4'b0010; end
                    4'b1111: begin nextstate = 4'b0100; end
                    4'b0010: begin nextstate = 4'b1000; end
                endcase
            end
            4'b0110: begin
                case(impact)
                    4'b0001: begin nextstate = 4'b0001; end
                    4'b0010: begin nextstate = 4'b0101; end
                    4'b0011: begin nextstate = 4'b1000; end
                    4'b1001: begin nextstate = 4'b1011; end
                    4'b1111: begin nextstate = 4'b1110; end
                    4'b1110: begin nextstate = 4'b1111; end
                endcase
            end
            4'b0111: begin
                case(impact)
                    4'b0000: begin nextstate = 4'b0000; end
                    4'b1100: begin nextstate = 4'b0010; end
                    4'b0101: begin nextstate = 4'b0101; end
                    4'b0011: begin nextstate = 4'b1010; end
                endcase
            end
            4'b1000: begin
                case(impact)
                    4'b1010: begin nextstate = 4'b0001; end
                    4'b1101: begin nextstate = 4'b0011; end
                    4'b0011: begin nextstate = 4'b0111; end
                    4'b1011: begin nextstate = 4'b1011; end
                    4'b0010: begin nextstate = 4'b1101; end
                endcase
            end
            4'b1001: begin
                case(impact)
                    4'b0000: begin nextstate = 4'b0100; end
                    4'b0001: begin nextstate = 4'b0110; end
                    4'b1110: begin nextstate = 4'b1100; end
                    4'b1010: begin nextstate = 4'b1110; end
                endcase
            end
            4'b1010: begin
                case(impact)
                    4'b0011: begin nextstate = 4'b0010; end
                    4'b1111: begin nextstate = 4'b0101; end
                    4'b1010: begin nextstate = 4'b1000; end
                    4'b0001: begin nextstate = 4'b1101; end
                endcase
            end
            4'b1011: begin
                case(impact)
                    4'b1010: begin nextstate = 4'b0001; end
                    4'b0101: begin nextstate = 4'b0100; end
                    4'b1101: begin nextstate = 4'b1000; end
                    4'b1001: begin nextstate = 4'b1110; end
                endcase
            end
            4'b1100: begin
                case(impact)
                    4'b1110: begin nextstate = 4'b0011; end
                    4'b1001: begin nextstate = 4'b0110; end
                    4'b1010: begin nextstate = 4'b1001; end
                    4'b1111: begin nextstate = 4'b1011; end
                    4'b0000: begin nextstate = 4'b1110; end
                endcase
            end
            4'b1101: begin
                case(impact)
                    4'b0010: begin nextstate = 4'b0000; end
                    4'b0101: begin nextstate = 4'b0010; end
                    4'b1001: begin nextstate = 4'b0011; end
                    4'b1110: begin nextstate = 4'b0101; end
                    4'b1111: begin nextstate = 4'b1010; end
                endcase
            end
            4'b1110: begin
                case(impact)
                    4'b1111: begin nextstate = 4'b0001; end
                    4'b1101: begin nextstate = 4'b0100; end
                    4'b1100: begin nextstate = 4'b0111; end
                endcase
            end
            4'b1111: begin
                case(impact)
                    4'b1100: begin nextstate = 4'b0011; end
                    4'b1010: begin nextstate = 4'b0110; end
                    4'b0000: begin nextstate = 4'b1010; end
                    4'b0100: begin nextstate = 4'b1100; end
                endcase
            end
        endcase
        
    end
endmodule
