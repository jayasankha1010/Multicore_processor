//Author - Chathura Jayasankha Gamage

module clock_divider
(
input clk,
output clk2
);

reg [7:0] counter = 0;

always @(posedge clk)
begin

counter<=counter+1;

end

assign  clk2 = counter[1];

endmodule