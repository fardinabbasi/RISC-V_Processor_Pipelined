`timescale 1ns / 1ns
module datapath(input rst, clk,JumpD,BranchD,MemWriteD,ALUSrcD,RegWriteD,WD3_SrcD,StallF,StallD,FlushD,FlushE,input[1:0]ResultSrcD,ForwardAE,ForwardBE,input [2:0]Imm_SrcD,input [2:0]ALUControlD
,output [6:0]OP,funct7,output [2:0] funct3,output [4:0]A1,A2,RdE,RdM,RdW,Rs1E,Rs2E,output [1:0]PCSrcE,ResultSrcE,output RegWriteM,RegWriteW);

wire [31:0] RD1,RD2,RD1E,RD2E,ALUResult,ALUResultM,A,ALUResultW,WriteDataM,WriteDataE,ExtImmD,ExtImmE,ExtImmM,ExtImmW,SrcAE,SrcBE,ResultW,instructionD,PCPlus4F,PCPlus4E,PCPlus4M,
PCPlus4W,PCPlus4D,PCTargetE,PCnext,PCF,PCE,PCD,ReadData,ReadDataW,RD,instruction,WD3,OUTWD3,WD;
wire ALUSrcE,MemWriteE,MemWriteM,RegWriteE,WE3,WE;
wire [24:0] Imm;
wire [1:0] ResultSrcM,ResultSrcW;
wire [2:0] ALUControlE,funct3E;
wire [4:0] A3;
wire [6:0] OPE;
mux_SrcBE1 muxb1(.RD2E(RD2E), .ResultW(ResultW), .ALUResultM(ALUResultM), .ForwardBE(ForwardBE), .WriteDataE(WriteDataE));
mux_SrcBE2 muxb2(.WriteDataE(WriteDataE), .ExtImmE(ExtImmE), .ALUSrcE(ALUSrcE), .SrcBE(SrcBE));
mux_SrcAE muxa(.RD1E(RD1E), .ResultW(ResultW), .ALUResultM(ALUResultM), .ForwardAE(ForwardAE), .SrcAE(SrcAE));
Instruction_Fetch fetch ( .instructionD(instructionD), .A1(A1), .A2(A2), .A3(A3), .OP(OP), .funct3(funct3), .Imm(Imm), .funct7(funct7));
pc_mux muxpc (.PCPlus4F(PCPlus4F), .PCTargetE(PCTargetE), .ALUResultM(ALUResult), .PCSrcE(PCSrcE), .PCnext(PCnext));
PCPlus4_adder pc4add(.PCF(PCF),.PCPlus4F(PCPlus4F));
PCTarget_adder pcimmadd(.PCE(PCE), .ExtImmE(ExtImmE), .PCTargetE(PCTargetE));
reglayer_four lay4 (.ALUResultM(ALUResultM), .ReadData(ReadData), .PCPlus4M(PCPlus4M), .RdM(RdM), .rst(rst), .clk(clk), .RegWriteM(RegWriteM), .ResultSrcM(ResultSrcM), .ExtImmM(ExtImmM), .ALUResultW(ALUResultW),
.ReadDataW(ReadDataW),.PCPlus4W(PCPlus4W), .RdW(RdW), .ResultSrcW(ResultSrcW), .RegWriteW(RegWriteW), .ExtImmW(ExtImmW));
Instruction_Memory instmeme (.PCF(PCF), .instruction(instruction));
reglayer_three lay3(.WriteDataE(WriteDataE), .ALUResult(ALUResult), .PCPlus4E(PCPlus4E), .RdE(RdE), .clk(clk), .rst(rst), .RegWriteE(RegWriteE), .MemWriteE(MemWriteE), .ResultSrcE(ResultSrcE),.ExtImmE(ExtImmE),
.ALUResultM(ALUResultM), .WriteDataM(WriteDataM), .PCPlus4M(PCPlus4M), .RdM(RdM), .RegWriteM(RegWriteM), .MemWriteM(MemWriteM), .ResultSrcM(ResultSrcM), .ExtImmM(ExtImmM));
Register_File regf (.A1(A1), .A2(A2), .A3(RdW), .WD3(ResultW), .clk(clk), .WE3(RegWriteW), .rst(rst), .RD1(RD1), .RD2(RD2));
result_mux resmux(.ALUResultW(ALUResultW), .ReadDataW(ReadDataW), .PCPlus4W(PCPlus4W), .ExtImmW(ExtImmW), .ResultSrcW(ResultSrcW), .ResultW(ResultW));
alu aluuuu(.SrcAE(SrcAE),.SrcBE(SrcBE), .ALUControlE(ALUControlE), .funct3E(funct3E), .ALUResult(ALUResult), .ZeroE(ZeroE));
datamem datameme (.WD(WriteDataM), .A(ALUResultM), .clk(clk), .WE(MemWriteM), .rst(rst), .ReadData(ReadData));
reglayer_one lay1(.rst(rst), .clk(clk), .StallD(StallD), .FlushD(FlushD), .instruction(instruction), .PCF(PCF), .PCPlus4F(PCPlus4F), .instructionD(instructionD), .PCD(PCD), .PCPlus4D(PCPlus4D));
Adress_Generator pcgen (.rst(rst),.clk(clk), .StallF(StallF),.PCnext(PCnext), .PCF(PCF));
sign_ext siext(.Imm_SrcD(Imm_SrcD), .Imm(Imm), .ExtImmD(ExtImmD));
//WD3_mux muxbewd3(.PCPlus4D(PCPlus4D), .ResultW(ResultW), .WD3_SrcD(WD3_SrcD), .OUTWD3(OUTWD3));
reglayer_two lay2(.OPD(OP),.OPE(OPE),.PCD(PCD), .ExtImmD(ExtImmD), .PCPlus4D(PCPlus4D), .RD1(RD1), .RD2(RD2), .A3(A3), .A1(A1), .A2(A2), .funct3(funct3), .rst(rst), .clk(clk), .RegWriteD(RegWriteD),
.MemWriteD(MemWriteD), .JumpD(JumpD), .BranchD(BranchD), .ALUSrcD(ALUSrcD), .ZeroE(ZeroE), .FlushE(FlushE), .ResultSrcD(ResultSrcD), .ALUControlD(ALUControlD), .RegWriteE(RegWriteE), .MemWriteE(MemWriteE), .JumpE(JumpE), .BranchE(BranchE), .ALUSrcE(ALUSrcE),
.PCSrcE(PCSrcE), .ResultSrcE(ResultSrcE), .ALUControlE(ALUControlE), .PCE(PCE), .ExtImmE(ExtImmE), .PCPlus4E(PCPlus4E), .RD1E(RD1E), .RD2E(RD2E), .funct3E(funct3E), .RdE(RdE), .Rs1E(Rs1E), .Rs2E(Rs2E));
endmodule