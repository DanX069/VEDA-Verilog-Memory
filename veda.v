module Veda (clk, reset, write_enable, address, data_in, data_out, mode);

parameter scribble = 1'b0, interpret = 1'b1;
input clk, reset, write_enable, mode;
input [4:0] address;
input [31:0] data_in;
output reg [31:0] data_out;

reg [31:0] memory [0:31];
integer i;
reg [31:0] intermediate_reg;

always @ (posedge clk or posedge reset) begin
	if (reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			memory[i] <= 32'b0;
		end
	end
	else begin
		if (write_enable && mode == scribble) begin
			memory[address] <= data_in;
			intermediate_reg <= data_in;
		end
		else if (write_enable) begin
			memory[address] <= data_in;
		end
		else if (mode == scribble) begin
			intermediate_reg <= data_in;
		end
		else if (mode == interpret) begin
			intermediate_reg <= memory[address];
		end
	end
end

always @ (posedge clk) begin
	data_out <= intermediate_reg;
end

endmodule
