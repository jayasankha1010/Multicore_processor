//author - Chathura Jayasankha Gamage

module regIR
#(parameter insWidth=4)
(
input clk,
input loadIR,
input [insWidth-1:0] insIN,
output reg [insWidth-1:0] insOUT
);

always@(negedge clk)
begin
if(loadIR)
	insOUT<=insIN;
end
endmodule