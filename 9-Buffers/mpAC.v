//author - Chathura Jayasankha Gamage
//to select between ALU and BUS

module mpAC
(
input [15:0] dataBUS,
input [15:0] dataALU,
input en,
output reg [15:0] dataOUT
);

always@(*)
begin
if (en)
	dataOUT <= dataALU;
else
	dataOUT <= dataBUS;
end

endmodule