/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 010  |   ALU_Out = A & B;
----------------------------------------------------------------------
| 011  |   ALU_Out = A | B;
----------------------------------------------------------------------
| 100  |   ALU_Out = A slt B;
----------------------------------------------------------------------
| 101  |   ALU_Out = A XOR B;
----------------------------------------------------------------------*/
module alu(
           input [31:0] SrcAE,SrcBE,  // ALU 32-bit Inputs
           input [2:0] ALUControlE,// ALU Selection
           input [2:0] funct3E,
           output[31:0] ALUResult, // ALU 32-bit Output
       output reg ZeroE  // Zero Flag
    );
    reg [31:0] ALU_Result;
    wire [32:0] tmp;
    assign ALUResult = ALU_Result; // ALU out
    assign tmp = {1'b0,SrcAE} + {1'b0,SrcBE};
  //assign Zero = (ALU_Result == 0);  // Zero Flag ALU_Result
  always @(*)
  begin
     case(funct3E)
     3'b000: ZeroE <= SrcAE == SrcBE; //beq
     3'b001: ZeroE <=  SrcAE != SrcBE; //bne
     3'b100: ZeroE <=  $signed(SrcAE) < $signed(SrcBE); //blt
     3'b101: ZeroE <=  $signed(SrcAE) > $signed(SrcBE); //bge
     default : ZeroE <= 0;
     endcase
  end
    always @(*)
    begin
        case(ALUControlE)
        3'b000: ALU_Result = SrcAE + SrcBE ;
        3'b001: ALU_Result= SrcAE - SrcBE ;
        3'b010: ALU_Result = SrcAE & SrcBE;
        3'b011: ALU_Result = SrcAE | SrcBE;
        3'b100: ALU_Result = ($signed(SrcAE)<$signed(SrcBE))?32'd1:32'd0;
        3'b101: ALU_Result = SrcAE ^ SrcBE;
        default: ALU_Result = SrcAE + SrcBE;
        endcase
    end
endmodule