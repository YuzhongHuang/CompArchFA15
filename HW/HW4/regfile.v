//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`include "register.v"
`include "mux.v"
`include "decoders.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

  wire[31:0] register

  decoder1to32 decode(register, RegWrite, WriteRegister); 

  register32zero register0(regOut0, WriteData, register[31], Clk);
	register32     register1(regOut1, WriteData, register[30], Clk);
	register32     register2(regOut2, WriteData, register[29], Clk);
	register32     register3(regOut3, WriteData, register[28], Clk);
	register32     register4(regOut4, WriteData, register[27], Clk);
	register32     register5(regOut5, WriteData, register[26], Clk);
	register32     register6(regOut6, WriteData, register[25], Clk);
	register32     register7(regOut7, WriteData, register[24], Clk);
	register32     register8(regOut8, WriteData, register[23], Clk);
	register32     register9(regOut9, WriteData, register[22], Clk);
	register32     register10(regOut10, WriteData, register[21], Clk);
	register32     register11(regOut11, WriteData, register[20], Clk);
	register32     register12(regOut12, WriteData, register[19], Clk);
	register32     register13(regOut13, WriteData, register[18], Clk);
	register32     register14(regOut14, WriteData, register[17], Clk);
	register32     register15(regOut15, WriteData, register[16], Clk);
	register32     register16(regOut16, WriteData, register[15], Clk);
	register32     register17(regOut17, WriteData, register[14], Clk);
	register32     register18(regOut18, WriteData, register[13], Clk);
	register32     register19(regOut19, WriteData, register[12], Clk);
	register32     register20(regOut20, WriteData, register[11], Clk);
	register32     register21(regOut21, WriteData, register[10], Clk);
	register32     register22(regOut22, WriteData, register[9], Clk);
	register32     register23(regOut23, WriteData, register[8], Clk);
	register32     register24(regOut24, WriteData, register[7], Clk);
	register32     register25(regOut25, WriteData, register[6], Clk);
	register32     register26(regOut26, WriteData, register[5], Clk);
	register32     register27(regOut27, WriteData, register[4], Clk);
	register32     register28(regOut28, WriteData, register[3], Clk);
	register32     register29(regOut29, WriteData, register[2], Clk);
	register32     register30(regOut30, WriteData, register[1], Clk);
	register32     register31(regOut31, WriteData, register[0], Clk);

	mux32to1by32 mux1(ReadData1, ReadRegister1, 
					  regOut0, regOut1, regOut2, regOut3, regOut4,
					  regOut5, regOut6, regOut7, regOut8, regOut9,
					  regOut10, regOut11, regOut12, regOut13, regOut14,
					  regOut15, regOut16, regOut17, regOut18, regOut19,
					  regOut20, regOut21, regOut22, regOut23, regOut24,
					  regOut25, regOut26, regOut27, regOut28, regOut29,
					  regOut30, regOut31);

	mux32to1by32 mux2(ReadData2, ReadRegister2, 
					  regOut0, regOut1, regOut2, regOut3, regOut4,
					  regOut5, regOut6, regOut7, regOut8, regOut9,
					  regOut10, regOut11, regOut12, regOut13, regOut14,
					  regOut15, regOut16, regOut17, regOut18, regOut19,
					  regOut20, regOut21, regOut22, regOut23, regOut24,
					  regOut25, regOut26, regOut27, regOut28, regOut29,
					  regOut30, regOut31);

endmodule