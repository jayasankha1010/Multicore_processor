//author - Chathura Jayasankha Gamage

module tribuffer16
(
input [15:0] dataIN,
input en,
output [15:0] dataOUT
);

assign dataOUT = en ? dataIN : 16'hZZZZ;

endmodule