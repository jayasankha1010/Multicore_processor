//author - Chathura Jayasankha Gamage

module regAR
#(parameter addrWidth=12)
(
input clk,
input loadAR,
input [addrWidth-1:0] dataIN,
output reg [addrWidth-1:0] dataOUT);


always@(negedge clk)
begin
	if(loadAR)
		dataOUT<=dataIN;
end

endmodule