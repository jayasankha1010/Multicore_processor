//author - Chathura Jayasankha Gamage

module regR
#(parameter dataWidth=16)
(
input clk,
input loadR,
input [dataWidth-1:0] dataIN,
output reg [dataWidth-1:0] dataOUT
);

always @(negedge clk)
begin
if (loadR)
	dataOUT<=dataIN;
end
endmodule