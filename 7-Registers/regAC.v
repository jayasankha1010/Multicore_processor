//author - Chathura Jayasankha Gamage

module regAC
#(parameter dataWidth=16)
(
input clk,
input loadAC,
input resetAC,
input [dataWidth-1:0] dataIN,
output reg [dataWidth-1:0] dataOUT
);

always @(negedge clk)
begin
if (loadAC)
	dataOUT<=dataIN;

if (resetAC)
	dataOUT<=0;
end



endmodule