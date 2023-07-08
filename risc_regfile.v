`timescale 1ns/1ns
module Register_File (
    input [4:0] A1,A2,A3,
    input [31:0] WD3,
    input clk,WE3,rst,
    output reg [31:0] RD1,RD2);
    reg [31:0] Registers[0:31];
    integer i;
    always @(*) begin
        RD1 <= Registers[A1];
        RD2 <= Registers[A2];
    end
    always @(*) begin
        if (rst) begin
            for(i=0;i<32;i=i+1)
                Registers[i]<=32'd0;
        end else if (WE3) begin
            Registers[A3]<=WD3;
            end
    end
    
endmodule