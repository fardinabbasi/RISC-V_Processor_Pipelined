`timescale 1ns/1ns
module risc_total(input rst,clk);

wire JumpD,BranchD,MemWriteD,ALUSrcD,RegWriteD,WD3_SrcD,StallF,StallD,FlushD,FlushE,RegWriteM,RegWriteW;
wire [1:0] ResultSrcD,ForwardAE,ForwardBE,PCSrcE,ResultSrcE;
wire [2:0] Imm_SrcD,ALUControlD,funct3;
wire [6:0] OP,funct7;
wire [4:0] A1,A2,RdE,RdM,RdW,Rs1E,Rs2E;

datapath DP(rst, clk,JumpD,BranchD,MemWriteD,ALUSrcD,RegWriteD,WD3_SrcD,StallF,StallD,FlushD,FlushE,ResultSrcD,ForwardAE,ForwardBE,Imm_SrcD,ALUControlD
,OP,funct7,funct3,A1,A2,RdE,RdM,RdW,Rs1E,Rs2E,PCSrcE,ResultSrcE,RegWriteM,RegWriteW);

Controller CU(OP,funct7,funct3,MemWriteD,ALUSrcD,RegWriteD,JumpD,BranchD,ResultSrcD,ALUControlD,Imm_SrcD,WD3_SrcD);

hazard_unit HU(clk,Rs1E,Rs2E,RdM,RdW,A1,A2,RdE,ResultSrcE,RegWriteM,RegWriteW,PCSrcE,StallF,StallD,FlushE,FlushD,ForwardAE,ForwardBE);
endmodule