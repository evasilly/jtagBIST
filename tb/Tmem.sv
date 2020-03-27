`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2020 02:06:06
// Design Name: 
// Module Name: Tmem
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


module Tmem(

    );

    reg clk, rst, write_en, read_en;
    reg [7:0] addr, write_data;

    wire [7:0] read_data;

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        write_en = 1'b0;
        read_en = 1'b0;
        addr = 8'b00000000;
        write_data = 8'b00000000;

        #10 rst = 1'b0;

        for (integer i = 0; i < 256; i++) begin
            #10 write_en = 1'b0;
                addr = i;
                write_data = i;
            #10 write_en = 1'b1;
        end

        #10
        write_en = 1'b0;
        write_data = 8'b00000000;

        for (integer i = 0; i < 256; i++) begin
            #10 read_en = 1'b0;
                addr = i;
            #10 read_en = 1'b1;
        end

    end

    always #5 clk = ~clk;



TMemory tmem1(
    .clk(clk),
    .rst(rst),
    
    .write_en(write_en),
    .read_en(read_en),

    .addr(addr),
    .write_data(write_data),

    .read_data(read_data)
    );

endmodule
