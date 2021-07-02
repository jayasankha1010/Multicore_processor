//author - Chathura Jayasankha Gamage

module CU
(
input clk,
input resetCU,
input [3:0] ins,
input z,
output reg ACselector, //to select whether BUS or the ALU loads the AC
output reg [1:0] ALUop, //toselect the operation for the ALU
output reg [7:0] REGld, //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
output reg [5:0] BUSld, //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
output reg MemWrite, //toselect whether memory write or read
output reg [1:0] REGreset, //reset the AC,reset the PC
output reg REGinc // inc pc  
);

reg [4:0] state = 0;

parameter fetch1 = 0, fetch2 =1, fetch3 =2, stac1=3, stac2=4, ldac1=5, ldac2 =6, ldac3=7;
parameter st1=8,st2=9,st3=10,ld1=11,ld2=12,ld3=13,mvat1=14,mvt1=15,mvar1=16,mvr1=17;
parameter clac1=18,add1=19,sub1=20,mult1=21,inc1=22,jpnz1=23,jmpz1=24,END1=25;
parameter branch=26;//nop1=27;

//always@(posedge resetCU)
//begin
//state <= 0;
//REGreset <= 2'b11;
//end

//always@(negedge resetCU)
//begin
//REGreset <= 2'b00;
//end

always@(posedge clk)
begin
if(~resetCU)
begin
	case(state)

	fetch1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b01000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b010000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=fetch2; //next state
		end
	
	fetch2:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00010000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b100000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 1; // inc pc  
		state		<=fetch3; //next state
		end	

	fetch3:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b01001000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state 		<= branch;
		end

	branch:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		
		//decide next state
		case(ins)
			0: state <= stac1;
			1: state <= ldac1;
			2: state <= st1;
			3: state <= ld1;
			4: state <= mvat1;
			5: state <= mvt1;
			6: state <= mvar1;
			7: state <= mvr1;
			8: state <= clac1;
			9: state <= add1;
			10: state <= sub1;
			11: state <= mult1;
			12: state <= inc1;
			13: state <= jpnz1;
			14: state <= jmpz1;
			15: state <= END1;
		endcase


		end

	stac1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00010000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000001; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=stac2; //next state
		end

	stac2:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b10000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 1; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	ldac1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=ldac2; //next state
		end

	ldac2:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00010000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b100000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= ldac3; //next state
		end

	ldac3:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	st1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00010000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000001; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=st2; //next state
		end

	st2:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b01000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000010; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= st3; //next state
		end

	st3:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b10000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 1; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	ld1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b01000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000001; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=ld2; //next state
		end

	ld2:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00010000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b100000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= ld3; //next state
		end

	ld3:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000010; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	mvat1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000100; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000001; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	mvt1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000100; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	mvar1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000010; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000001; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	mvr1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000010; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	clac1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 2'b01; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	add1:
		begin
		ACselector 	<= 1; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	sub1:
		begin
		ACselector 	<= 1; //to select whether BUS or the ALU loads the AC
		ALUop		<= 1; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	mult1:
		begin
		ACselector 	<= 1; //to select whether BUS or the ALU loads the AC
		ALUop		<= 2; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	inc1:
		begin
		ACselector 	<= 1; //to select whether BUS or the ALU loads the AC
		ALUop		<= 3; //toselect the operation for the ALU
		REGld		<= 8'b00000001; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

	jpnz1:
		begin
		
		if(~z)
		begin
			ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
			ALUop		<= 0; //toselect the operation for the ALU
			REGld		<= 8'b00100000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
			BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
			MemWrite	<= 0; //toselect whether memory write or read
			REGreset	<= 0; //reset the AC,reset the PC
			REGinc		<= 0; // inc pc  
			state		<= fetch1; //next state
		end

		else
		begin
			ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
			ALUop		<= 0; //toselect the operation for the ALU
			REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
			BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
			MemWrite	<= 0; //toselect whether memory write or read
			REGreset	<= 0; //reset the AC,reset the PC
			REGinc		<= 0; // inc pc  
			state		<= fetch1; //next state
		end

		end
		
	jmpz1:
		begin
		
		if(z)
		begin
			ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
			ALUop		<= 0; //toselect the operation for the ALU
			REGld		<= 8'b00100000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
			BUSld		<= 6'b001000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
			MemWrite	<= 0; //toselect whether memory write or read
			REGreset	<= 0; //reset the AC,reset the PC
			REGinc		<= 0; // inc pc  
			state		<= fetch1; //next state
		end

		else
		begin
			ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
			ALUop		<= 0; //toselect the operation for the ALU
			REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
			BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
			MemWrite	<= 0; //toselect whether memory write or read
			REGreset	<= 0; //reset the AC,reset the PC
			REGinc		<= 0; // inc pc  
			state		<= fetch1; //next state
		end

		end
	
	//will not be used
	//nop1:
		//begin
		//ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		//ALUop		<= 0; //toselect the operation for the ALU
		//REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		//BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		//MemWrite	<= 0; //toselect whether memory write or read
		//REGreset	<= 0; //reset the AC,reset the PC
		//REGinc		<= 0; // inc pc  
		//state		<= fetch1; //next state
		//end

	END1:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= END1; //next state
		end

	default:
		begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 0; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<= fetch1; //next state
		end

		
	endcase
end
else 
begin
		ACselector 	<= 0; //to select whether BUS or the ALU loads the AC
		ALUop		<= 0; //toselect the operation for the ALU
		REGld		<= 8'b00000000; //Memoryin,ARld,PCld,DRld,IRld,TRld,Rld,ACld,
		BUSld		<= 6'b000000; //Memoryout,PCbus,DRbus, TRbus,Rbus,ACbus,
		MemWrite	<= 0; //toselect whether memory write or read
		REGreset	<= 2'b11; //reset the AC,reset the PC
		REGinc		<= 0; // inc pc  
		state		<=fetch1; //next state
end
end



endmodule  