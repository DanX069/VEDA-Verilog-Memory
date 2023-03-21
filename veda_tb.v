module testbench;

reg clk, reset, write_enable, mode;
reg [4:0] address;
reg [31:0] data_in;
wire [31:0] data_out;

Veda uut (clk, reset, write_enable, address, data_in, data_out, mode);

initial begin
	clk = 0;
	reset = 0;
	address = 0;
	data_in = 0;
	write_enable = 0;
	mode = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile ("Veda.vcd");
	$dumpvars(0, testbench);

	address = 5;
	data_in = 32'h12345678;
	write_enable = 1;
	mode = 0;
	#10;
	write_enable = 1;
	mode = 1;
	address = 7;
	data_in = 32'h12238897;
	#10;
	write_enable = 0;
	mode = 1;
	address = 7;
	
	#100 $finish;
	
end

endmodule
