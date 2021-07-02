//author - Chathura Jayasankha Gamage

module regZ
#(parameter dataWidth = 16)
(
input clk,
input [dataWidth-1:0] dataIN,
output reg Z
);

always@(negedge clk)
begin
if(dataIN==0)
	Z<=1;
else
	Z<=0;
end

endmodule