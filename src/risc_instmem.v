`timescale 1ns/1ns
module Instruction_Memory (
    input [31:0] PCF,
    output reg [31:0] instruction
);
    reg [31:0] instructions_Value[0:999];
initial begin
    $readmemh("instruction.txt", instructions_Value);
end
    always@(*) begin
    instruction = instructions_Value[PCF/4];
    end
endmodule
