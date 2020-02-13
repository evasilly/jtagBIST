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
            MEM[0] = 8'b1111_1101;
            MEM[1] = 8'b0010_0000;
            MEM[2] = 8'b1000_0110;
        end else if (read_en && addr_valid) begin
            read_data <= MEM[addr];
        end else if (write_en && addr_valid) begin
            MEM[addr] <= write_data;
//        end else begin
//            read_data <= 8'hXX;
        end
    end

endmodule
