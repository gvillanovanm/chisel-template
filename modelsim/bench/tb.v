module tb();

reg  a, b; // inputs
wire s, c; // outputs

reg  clk; 
reg  rst;
reg  enable;
reg [31:0] timer_load;
reg  timeout;
reg [31:0] timervalue;

timer timer_tb(
	.clk(clk), 
	.rst(clk), 
	.enable(clk),
	.timer_load(clk),
	.timeout(clk),
	.timervalue(clk)
);

always
	#5  clk =  ! clk; 

initial begin
	rst = 1'b0;
	#50

	enable = 0;
	timer_load = 255;
	#50
	
	enable = 1;
	#500

	enable = 0;
	#50
	$finish;
end

endmodule