//Author - Chathura Jayasankha Gamage

module memorycontroller
(
input clk16,

input [11:0] addr0_,
input we0_,
input [15:0] dataIN0_,
output reg [15:0] dataOUT0_,

input [11:0] addr1_,
input we1_,
input [15:0] dataIN1_,
output reg [15:0] dataOUT1_,

input [11:0] addr2_,
input we2_,
input [15:0] dataIN2_,
output reg [15:0] dataOUT2_,

input [11:0] addr3_,
input we3_,
input [15:0] dataIN3_,
output reg [15:0] dataOUT3_,

input [11:0] addr4_,
input we4_,
input [15:0] dataIN4_,
output reg [15:0] dataOUT4_,

input [11:0] addr5_,
input we5_,
input [15:0] dataIN5_,
output reg [15:0] dataOUT5_,

input [11:0] addr6_,
input we6_,
input [15:0] dataIN6_,
output reg [15:0] dataOUT6_,

input [11:0] addr7_,
input we7_,
input [15:0] dataIN7_,
output reg [15:0] dataOUT7_,



output reg [11:0] addr_,
output reg we_,
output reg [15:0] dataIN_,
input [15:0] dataOUT_

);

reg [2:0] counter = 0;

always @(posedge clk16)
begin

counter<=counter+1;

case(counter)

	3'd0: 
		begin
		addr_ <= addr0_;
		we_ <= we0_;
		dataIN_ <= dataIN0_;
		dataOUT0_ <= dataOUT_;
		end
	3'd1: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+1;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		
	3'd2: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+2;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		
	3'd3: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+3;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		
	3'd4: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+4;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
	
	3'd4: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+4;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		
	3'd5: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+5;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
	
	3'd6: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+6;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		
	3'd7: 
		begin
		if(addr1_>3499) 
		begin
			addr_ <= addr1_+7;
		end
		else
		begin
			addr_ <= addr1_;
		end
			
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end
		

endcase
end

endmodule

