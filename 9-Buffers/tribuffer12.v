//author - Chathura Jayasankha Gamage

module tribuffer12
(
input [11:0] dataIN,
input en,
output [11:0] dataOUT
);

assign dataOUT = en ? dataIN : 12'hZZZ;

endmodule