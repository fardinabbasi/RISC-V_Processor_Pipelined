`timescale 1ns/1ns
module Instruction_Fetch (
    input [31:0] instructionD,
    output reg [4:0] A1,A2,A3,
    output reg [6:0] OP,
    output reg [2:0] funct3,
    output reg [24:0] Imm,
    output reg [6:0] funct7
);
    always @(*) begin
        A1 <= instructionD[19:15];
        A2 <= instructionD[24:20];
        A3 <= instructionD[11:7];
        OP <= instructionD[6:0];
        funct3 <= instructionD[14:12];
        Imm <= instructionD[31:7];
        funct7 <= instructionD[31:25];
    end
endmodule