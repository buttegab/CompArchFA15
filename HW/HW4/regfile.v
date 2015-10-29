`include "decoders.v"
`include "mux32to1by32.v"
`include "register32.v"
//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		clk		// Clock (Positive Edge Triggered)
);
wire[31:0] registers[31:0];
wire[31:0] flags;



decoder1to32 decoder(flags, RegWrite, WriteRegister);
register32 r0(registers[0], 32'd0, flags[0], clk);
register32 r1(registers[1], WriteData, flags[1], clk);
register32 r2(registers[2], WriteData, flags[2], clk);
register32 r3(registers[3], WriteData, flags[3], clk);
register32 r4(registers[4], WriteData, flags[4], clk);
register32 r5(registers[5], WriteData, flags[5], clk);
register32 r6(registers[6], WriteData, flags[6], clk);
register32 r7(registers[7], WriteData, flags[7], clk);
register32 r8(registers[8], WriteData, flags[8], clk);
register32 r9(registers[9], WriteData, flags[9], clk);
register32 r10(registers[10], WriteData, flags[10], clk);
register32 r11(registers[11], WriteData, flags[11], clk);
register32 r12(registers[12], WriteData, flags[12], clk);
register32 r13(registers[13], WriteData, flags[13], clk);
register32 r14(registers[14], WriteData, flags[14], clk);
register32 r15(registers[15], WriteData, flags[15], clk);
register32 r16(registers[16], WriteData, flags[16], clk);
register32 r17(registers[17], WriteData, flags[17], clk);
register32 r18(registers[18], WriteData, flags[18], clk);
register32 r19(registers[19], WriteData, flags[19], clk);
register32 r20(registers[20], WriteData, flags[20], clk);
register32 r21(registers[21], WriteData, flags[21], clk);
register32 r22(registers[22], WriteData, flags[22], clk);
register32 r23(registers[23], WriteData, flags[23], clk);
register32 r24(registers[24], WriteData, flags[24], clk);
register32 r25(registers[25], WriteData, flags[25], clk);
register32 r26(registers[26], WriteData, flags[26], clk);
register32 r27(registers[27], WriteData, flags[27], clk);
register32 r28(registers[28], WriteData, flags[28], clk);
register32 r29(registers[29], WriteData, flags[29], clk);
register32 r30(registers[30], WriteData, flags[30], clk);
register32 r31(registers[31], WriteData, flags[31], clk);



mux32to1by32 read1(ReadData1, ReadRegister1, registers[0], registers[1], registers[2], registers[3], registers[4], registers[5], registers[6], registers[7], registers[8], registers[9], registers[10], registers[11], registers[12], registers[13], registers[14], registers[15], registers[16], registers[17], registers[18], registers[19], registers[20], registers[21], registers[22], registers[23], registers[24], registers[25], registers[26], registers[27], registers[28], registers[29], registers[30], registers[31]);
mux32to1by32 read2(ReadData2, ReadRegister2, registers[0], registers[1], registers[2], registers[3], registers[4], registers[5], registers[6], registers[7], registers[8], registers[9], registers[10], registers[11], registers[12], registers[13], registers[14], registers[15], registers[16], registers[17], registers[18], registers[19], registers[20], registers[21], registers[22], registers[23], registers[24], registers[25], registers[26], registers[27], registers[28], registers[29], registers[30], registers[31]);

endmodule


