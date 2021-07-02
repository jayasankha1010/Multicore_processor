//author - Chathura Jayasankha Gamage

module regTR
#(parameter dataWidth=16)
(
input clk,
input loadTR,
input [dataWidth-1:0] dataIN,
output reg [dataWidth-1:0] dataOUT
);

always @(negedge clk)
begin
if (loadTR)
	dataOUT<=dataIN;
end
endmodule