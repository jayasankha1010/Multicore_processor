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
// CREATED		"Fri Jul 02 20:04:24 2021"

module Octacore_processor(
	clock,
	reset_process
);


input wire	clock;
input wire	reset_process;

wire	[11:0] addr0;
wire	[11:0] addr1;
wire	[11:0] addr2;
wire	[11:0] addr3;
wire	[11:0] addr4;
wire	[11:0] addr5;
wire	[11:0] addr6;
wire	[11:0] addr7;
wire	[11:0] address;
wire	[15:0] datafromMEM;
wire	[15:0] dataintoMEM;
wire	[15:0] MEMin0;
wire	[15:0] MEMin1;
wire	[15:0] MEMin2;
wire	[15:0] MEMin3;
wire	[15:0] MEMin4;
wire	[15:0] MEMin5;
wire	[15:0] MEMin6;
wire	[15:0] MEMin7;
wire	[15:0] MEMout0;
wire	[15:0] MEMout1;
wire	[15:0] MEMout2;
wire	[15:0] MEMout3;
wire	[15:0] MEMout4;
wire	[15:0] MEMout5;
wire	[15:0] MEMout6;
wire	[15:0] MEMout7;
wire	reset;
wire	we;
wire	we0;
wire	we1;
wire	we2;
wire	we3;
wire	we4;
wire	we5;
wire	we6;
wire	we7;
wire	SYNTHESIZED_WIRE_8;





memorycontroller	b2v_inst(
	.clk16(clock),
	.we0_(we0),
	.we1_(we1),
	.we2_(we2),
	.we3_(we3),
	.we4_(we4),
	.we5_(we5),
	.we6_(we6),
	.we7_(we7),
	.addr0_(addr0),
	.addr1_(addr1),
	.addr2_(addr2),
	.addr3_(addr3),
	.addr4_(addr4),
	.addr5_(addr5),
	.addr6_(addr6),
	.addr7_(addr7),
	.dataIN0_(MEMin0),
	.dataIN1_(MEMin1),
	.dataIN2_(MEMin2),
	.dataIN3_(MEMin3),
	.dataIN4_(MEMin4),
	.dataIN5_(MEMin5),
	.dataIN6_(MEMin6),
	.dataIN7_(MEMin7),
	.dataOUT_(datafromMEM),
	.we_(we),
	.addr_(address),
	.dataIN_(dataintoMEM),
	.dataOUT0_(MEMout0),
	.dataOUT1_(MEMout1),
	.dataOUT2_(MEMout2),
	.dataOUT3_(MEMout3),
	.dataOUT4_(MEMout4),
	.dataOUT5_(MEMout5),
	.dataOUT6_(MEMout6),
	.dataOUT7_(MEMout7));


memory	b2v_inst1(
	.clk(clock),
	.we(we),
	.addr(address),
	.din(dataintoMEM),
	.dout(datafromMEM));
	defparam	b2v_inst1.Addr_width = 12;
	defparam	b2v_inst1.Data_width = 16;


singlecore	b2v_inst10(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout4),
	.MEMwrite(we4),
	.address(addr4),
	.intoMEM(MEMin4));


singlecore	b2v_inst11(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout1),
	.MEMwrite(we1),
	.address(addr1),
	.intoMEM(MEMin1));


clock_divider	b2v_inst3(
	.clkin(clock),
	.clkout(SYNTHESIZED_WIRE_8));


singlecore	b2v_inst4(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout7),
	.MEMwrite(we7),
	.address(addr7),
	.intoMEM(MEMin7));


singlecore	b2v_inst5(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout5),
	.MEMwrite(we5),
	.address(addr5),
	.intoMEM(MEMin5));


singlecore	b2v_inst6(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout6),
	.MEMwrite(we6),
	.address(addr6),
	.intoMEM(MEMin6));


singlecore	b2v_inst7(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout0),
	.MEMwrite(we0),
	.address(addr0),
	.intoMEM(MEMin0));


singlecore	b2v_inst8(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout3),
	.MEMwrite(we3),
	.address(addr3),
	.intoMEM(MEMin3));


singlecore	b2v_inst9(
	.resetCU(reset),
	.clock(SYNTHESIZED_WIRE_8),
	.outfromMEM(MEMout2),
	.MEMwrite(we2),
	.address(addr2),
	.intoMEM(MEMin2));

assign	reset = reset_process;

endmodule
