module tb();

/* Inputs */
reg  clk; 
reg  rst;
reg  io_ctl_enq_valid;
reg [7:0] io_ctl_enq_bits;
reg  io_ctl_deq_ready;
reg  io_pins_rxd;
    
/* Outputs */
wire io_ctl_enq_ready;
wire io_ctl_deq_valid;
wire[7:0] io_ctl_deq_bits;
wire io_pins_txd;

Uart uart_tb(
	.clk(clk), 
	.reset(rst), 
    .io_ctl_enq_valid(io_ctl_enq_valid),
    .io_ctl_enq_bits(io_ctl_enq_bits),
    .io_ctl_deq_ready(io_ctl_deq_ready),
    .io_pins_rxd(io_pins_rxd),
    .io_ctl_enq_ready(io_ctl_enq_ready),
    .io_ctl_deq_valid(io_ctl_deq_valid),
    .io_ctl_deq_bits(io_ctl_deq_bits),
    .io_pins_txd(io_pins_txd)
);

always
	#5  clk =  !clk; 

initial begin
	clk = 1'b0;
	rst = 1'b1;
	io_ctl_enq_valid = 0;
	io_ctl_deq_ready = 0;
	io_pins_rxd = 0;
	io_ctl_enq_bits = 0;
	#5

	rst = 1'b0;
	#5

	// start
	io_enq_bits = 8'hFE;
	io_deq_ready = 1'b1;
	#200
	
	io_enq_valid = 1'b1;
	#500
	$finish;
end

endmodule