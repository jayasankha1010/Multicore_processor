//Author - Chathura Jayasankha Gamage

module clock_divider
(
input clkin,
output clkout
);

reg [7:0] counter = 0;

always @(posedge clkin)
begin

counter<=counter+1;

end

assign  clkout = counter[3];

endmodule