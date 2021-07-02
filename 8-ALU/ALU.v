//author - Chathura Jayasankha Gamage

module ALU
(
input [15:0] inAC,
input [15:0] inR,
input [1:0] op,
output reg [15:0] outAC
);

always @(*)
begin
if(op==2'b00)
	outAC <=inAC+inR;
else if (op==2'b01)
	outAC <=inAC-inR;
else if (op==2'b10)
	outAC <=inAC*inR;
else if (op==2'b11)
	outAC <=inAC+1;
end

endmodule