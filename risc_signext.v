module sign_ext (input [2:0]Imm_SrcD,input [24:0] Imm,output reg [31:0]ExtImmD);
  always@(*)
  case(Imm_SrcD)
  //I_type
  3'b000: ExtImmD={{20{Imm[24]}},Imm[24:13]};
  //S_type
  3'b001: ExtImmD = {{20{Imm[24]}}, Imm[24:18], Imm[4:0]};
  //B_type
  3'b010: ExtImmD = {{20{Imm[24]}}, Imm[0],  Imm[23:18], Imm[4:1], 1'b0};
  // u type
	3'b011: ExtImmD ={Imm[24:5],12'b000000000000};
  // j type
	3'b100: ExtImmD =  {{12{Imm[24]}}, Imm[12:5],  Imm[13], Imm[23:14], 1'b0};
  default: 	ExtImmD = 32'bx; // undefined
    endcase
endmodule
