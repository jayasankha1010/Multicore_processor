//author - Chathura Jayasankha Gamage

module regPC
#(parameter addrWidth=12)
(
input clk,
input reset,
input loadPC,
input incPC,
input [addrWidth-1:0] dataIN,
output reg [addrWidth-1:0] dataOUT = 0
);

always@(negedge clk or posedge reset)
begin
if (reset)
	dataOUT<=0;
else if(loadPC)
	dataOUT<=dataIN;
else if(incPC)
	dataOUT<=dataOUT+1;

end

endmodule