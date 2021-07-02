module memorycontroller
(
input clk,
input clkx,

input [11:0] addr0_,
input we0_,
input [15:0] dataIN0_,
output reg [15:0] dataOUT0_,

input [11:0] addr1_,
input we1_,
input [15:0] dataIN1_,
output reg [15:0] dataOUT1_,

//input [11:0] addr2,
//input we2,
//input [15:0] dataIN2,
//output [15:0] dataOUT2,

//input [11:0] addr3,
//input we3,
//input [15:0] dataIN3,
//output [15:0] dataOUT3,

//input [11:0] addr4,
//input we4,
//input [15:0] dataIN4,
//output [15:0] dataOUT4,

//input [11:0] addr5,
//input we5,
//input [15:0] dataIN5,
//output [15:0] dataOUT5,

//input [11:0] addr6,
//input we6,
//input [15:0] dataIN6,
//output [15:0] dataOUT6,

//input [11:0] addr7,
//input we7,
//input [15:0] dataIN7,
//output [15:0] dataOUT7,

output reg [11:0] addr_,
output reg we_,
output reg [15:0] dataIN_,
input [15:0] dataOUT_

);

reg counter = 0;

always @(posedge clkx)
begin

counter<=counter+1;

case(counter)

	1'b0: 
		begin
		addr_ <= addr0_;
		we_ <= we0_;
		dataIN_ <= dataIN0_;
		dataOUT0_ <= dataOUT_;
		end
	1'b1: 
		begin
		//if(addr1_>3500)
		//addr_ <= addr1_+1;
		//else
		addr_ <= addr1_;
		we_ <= we1_;
		dataIN_ <= dataIN1_;
		dataOUT1_ <= dataOUT_;
		end

endcase
end

endmodule

