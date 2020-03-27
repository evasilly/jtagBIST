`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.12.2019 14:00:02
// Design Name: 
// Module Name: TMemory
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


module TMemory(
    input clk,
    input rst,
    
    input write_en,
    input read_en,

    input [7:0] addr,
    input [7:0] write_data,

    output reg [7:0] read_data
    );

    reg [7:0] MEM [0:255]; // main memory
    wire addr_valid;

    assign addr_valid = (addr >= 8'h00) && (addr <= 8'hFF);

    always@(posedge clk)
    begin
        if (rst) begin
            MEM[0] = 8'b00000010;
            MEM[1] = 8'b10110001;
            MEM[2] = 8'b11110000;
            MEM[3] = 8'b10000110;
            MEM[4] = 8'b00010001;
            MEM[5] = 8'b10110011;
            MEM[6] = 8'b10100100;
            MEM[7] = 8'b11110001;
            MEM[8] = 8'b11001000;
            MEM[9] = 8'b10100001;
            MEM[10] = 8'b00101011;
            MEM[11] = 8'b10100001;
            MEM[12] = 8'b11110000;
            MEM[13] = 8'b10011010;
            MEM[14] = 8'b00110010;
            MEM[15] = 8'b11110101;
            MEM[16] = 8'b11000000;
            MEM[17] = 8'b11111101;
            MEM[18] = 8'b00100000;
            MEM[19] = 8'b00000010;
            MEM[20] = 8'b01100111;
            MEM[21] = 8'b00000000;
            MEM[22] = 8'b00000010;
            MEM[23] = 8'b00001001;
            MEM[24] = 8'b00000100;
            MEM[25] = 8'b00010111;
            MEM[26] = 8'b11000010;
            MEM[27] = 8'b11001110;
            MEM[28] = 8'b11110001;
            MEM[29] = 8'b10110011;
            MEM[30] = 8'b01101111;
            MEM[31] = 8'b11000011;
            MEM[32] = 8'b10100100;
            MEM[33] = 8'b01011100;
            MEM[34] = 8'b11100011;
            MEM[35] = 8'b10100100;
            MEM[36] = 8'b00010111;
            MEM[37] = 8'b01010101;
            MEM[38] = 8'b00110010;
            MEM[39] = 8'b11110101;
            MEM[40] = 8'b11110100;
            MEM[41] = 8'b00010111;
            MEM[42] = 8'b01010101;
            MEM[43] = 8'b00101000;
            MEM[44] = 8'b11010011;
            MEM[45] = 8'b01101111;
            MEM[46] = 8'b10100110;
            MEM[47] = 8'b00100101;
            MEM[48] = 8'b11000000;
            MEM[49] = 8'b10000110;
            MEM[50] = 8'b00111000;
            MEM[51] = 8'b00110111;
            MEM[52] = 8'b00111010;
            MEM[53] = 8'b11110101;
            MEM[54] = 8'b11000000;
            MEM[55] = 8'b10000110;
            MEM[56] = 8'b10011011;
            MEM[57] = 8'b01010100;
            MEM[58] = 8'b01011100;
            MEM[59] = 8'b10010110;
            MEM[60] = 8'b11111110;
            MEM[61] = 8'b11010100;
            MEM[62] = 8'b01011100;
            MEM[63] = 8'b10010110;
            MEM[64] = 8'b11101111;
            MEM[65] = 8'b00001010;
            MEM[66] = 8'b10101000;
            MEM[67] = 8'b10111011;
            MEM[68] = 8'b11011000;
            MEM[69] = 8'b00101101;
            MEM[70] = 8'b01010010;
            MEM[71] = 8'b00001001;
            MEM[72] = 8'b00010110;
            MEM[73] = 8'b00100101;
            MEM[74] = 8'b11000000;
            MEM[75] = 8'b00000010;
            MEM[76] = 8'b00001001;
            MEM[77] = 8'b11101100;
            MEM[78] = 8'b10101001;
            MEM[79] = 8'b10101110;
            MEM[80] = 8'b11000111;
            MEM[81] = 8'b00111010;
            MEM[82] = 8'b00011101;
            MEM[83] = 8'b10010011;
            MEM[84] = 8'b10100100;
            MEM[85] = 8'b11110001;
            MEM[86] = 8'b00101011;
            MEM[87] = 8'b10011110;
            MEM[88] = 8'b11010100;
            MEM[89] = 8'b01011100;
            MEM[90] = 8'b11111011;
            MEM[91] = 8'b01010100;
            MEM[92] = 8'b01011100;
            MEM[93] = 8'b00001110;
            MEM[94] = 8'b11010100;
            MEM[95] = 8'b00010111;
            MEM[96] = 8'b00000000;
            MEM[97] = 8'b11111101;
            MEM[98] = 8'b11100101;
            MEM[99] = 8'b11000000;
            MEM[100] = 8'b11111101;
            MEM[101] = 8'b11111010;
            MEM[102] = 8'b00110010;
            MEM[103] = 8'b11110101;
            MEM[104] = 8'b00101000;
            MEM[105] = 8'b10100001;
            MEM[106] = 8'b10110011;
            MEM[107] = 8'b01101111;
            MEM[108] = 8'b01001100;
        end else if (read_en && addr_valid) begin
            read_data = MEM[addr];
        end else if (write_en && addr_valid) begin
            MEM[addr] = write_data;
        end
    end

endmodule
