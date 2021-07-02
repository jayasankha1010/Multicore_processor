//author - Chathura Jayasankha Gamage

module regDR
#(parameter dataWidth = 16)
(
input clk,
input loadDR,
input [dataWidth-1:0] dataIN,
output reg [dataWidth-1:0] dataOUT
);

always@(negedge clk)
begin
if (loadDR)
	dataOUT<=dataIN;
end

endmodule