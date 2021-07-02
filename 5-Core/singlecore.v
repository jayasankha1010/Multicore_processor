// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Intel and sold by Intel or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 16.1.2 Build 203 01/18/2017 SJ Lite Edition"
// CREATED		"Fri Jul 02 15:38:24 2021"

module singlecore(
	resetCU,
	clock,
	outfromMEM,
	MEMwrite,
	address,
	intoMEM
);


input wire	resetCU;
input wire	clock;
input wire	[15:0] outfromMEM;
output wire	MEMwrite;
output wire	[11:0] address;
output wire	[15:0] intoMEM;

wire	[15:0] AC;
wire	ACselector;
wire	[1:0] ALUop;
wire	[15:0] ALUresult;
wire	[15:0] bus;
wire	[5:0] BUSld;
wire	[15:0] DRout;
wire	[3:0] ins;
wire	[11:0] PC;
wire	[15:0] R;
wire	REGinc;
wire	[7:0] REGld;
wire	[1:0] REGreset;
wire	[15:0] TR;
wire	z;
wire	[15:0] SYNTHESIZED_WIRE_0;





ALU	b2v_inst(
	.inAC(AC),
	.inR(R),
	.op(ALUop),
	.outAC(ALUresult));


regAC	b2v_inst1(
	.clk(clock),
	.loadAC(REGld[0]),
	.resetAC(REGreset[0]),
	.dataIN(SYNTHESIZED_WIRE_0),
	.dataOUT(AC));
	defparam	b2v_inst1.dataWidth = 16;


mpAC	b2v_inst10(
	.en(ACselector),
	.dataALU(ALUresult),
	.dataBUS(bus),
	.dataOUT(SYNTHESIZED_WIRE_0));


regZ	b2v_inst11(
	.clk(clock),
	.dataIN(AC),
	.Z(z));
	defparam	b2v_inst11.dataWidth = 16;


tribuffer12	b2v_inst12(
	.en(BUSld[4]),
	.dataIN(PC),
	.dataOUT(bus[11:0]));


tribuffer16	b2v_inst14(
	.en(BUSld[3]),
	.dataIN(DRout),
	.dataOUT(bus));


tribuffer16	b2v_inst15(
	.en(BUSld[2]),
	.dataIN(TR),
	.dataOUT(bus));


tribuffer16	b2v_inst16(
	.en(BUSld[1]),
	.dataIN(R),
	.dataOUT(bus));


tribuffer16	b2v_inst17(
	.en(BUSld[5]),
	.dataIN(outfromMEM),
	.dataOUT(bus));


tribuffer16	b2v_inst18(
	.en(REGld[7]),
	.dataIN(bus),
	.dataOUT(intoMEM));


tribuffer16	b2v_inst19(
	.en(BUSld[0]),
	.dataIN(AC),
	.dataOUT(bus));


regTR	b2v_inst2(
	.clk(clock),
	.loadTR(REGld[2]),
	.dataIN(bus),
	.dataOUT(TR));
	defparam	b2v_inst2.dataWidth = 16;


regIR	b2v_inst3(
	.clk(clock),
	.loadIR(REGld[3]),
	.insIN(DRout[15:12]),
	.insOUT(ins));
	defparam	b2v_inst3.insWidth = 4;


regDR	b2v_inst4(
	.clk(clock),
	.loadDR(REGld[4]),
	.dataIN(bus),
	.dataOUT(DRout));
	defparam	b2v_inst4.dataWidth = 16;


regPC	b2v_inst5(
	.clk(clock),
	.reset(REGreset[1]),
	.loadPC(REGld[5]),
	.incPC(REGinc),
	.dataIN(bus[11:0]),
	.dataOUT(PC));
	defparam	b2v_inst5.addrWidth = 12;


CU	b2v_inst6(
	.clk(clock),
	.resetCU(resetCU),
	.z(z),
	.ins(ins),
	.ACselector(ACselector),
	.MemWrite(MEMwrite),
	.REGinc(REGinc),
	.ALUop(ALUop),
	.BUSld(BUSld),
	.REGld(REGld),
	.REGreset(REGreset));
	defparam	b2v_inst6.add1 = 19;
	defparam	b2v_inst6.clac1 = 18;
	defparam	b2v_inst6.END1 = 25;
	defparam	b2v_inst6.fetch1 = 0;
	defparam	b2v_inst6.fetch2 = 1;
	defparam	b2v_inst6.fetch3 = 2;
	defparam	b2v_inst6.inc1 = 22;
	defparam	b2v_inst6.jpnz1 = 23;
	defparam	b2v_inst6.ld1 = 11;
	defparam	b2v_inst6.ld2 = 12;
	defparam	b2v_inst6.ld3 = 13;
	defparam	b2v_inst6.ldac1 = 5;
	defparam	b2v_inst6.ldac2 = 6;
	defparam	b2v_inst6.ldac3 = 7;
	defparam	b2v_inst6.mult1 = 21;
	defparam	b2v_inst6.mvar1 = 16;
	defparam	b2v_inst6.mvat1 = 14;
	defparam	b2v_inst6.mvr1 = 17;
	defparam	b2v_inst6.mvt1 = 15;
	defparam	b2v_inst6.nop1 = 24;
	defparam	b2v_inst6.st1 = 8;
	defparam	b2v_inst6.st2 = 9;
	defparam	b2v_inst6.st3 = 10;
	defparam	b2v_inst6.stac1 = 3;
	defparam	b2v_inst6.stac2 = 4;
	defparam	b2v_inst6.sub1 = 20;


regR	b2v_inst8(
	.clk(clock),
	.loadR(REGld[1]),
	.dataIN(bus),
	.dataOUT(R));
	defparam	b2v_inst8.dataWidth = 16;


regAR	b2v_inst9(
	.clk(clock),
	.loadAR(REGld[6]),
	.dataIN(bus[11:0]),
	.dataOUT(address));
	defparam	b2v_inst9.addrWidth = 12;


endmodule
