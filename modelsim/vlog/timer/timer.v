module timer( 
  input reg  clk, 
  input reg  rst, 
  input reg  enable,
  input reg [31:0] timer_load,
  output reg  timeout,
  output reg [31:0] timervalue 
);
  reg [31:0] auxTimerLoad;
    
  always @(posedge clk) begin
    if(rst) begin
      timeout      <= 0;
      timervalue   <= 0;
    end else begin
      if(enable) begin
          if(auxTimerLoad!=0) begin
            auxTimerLoad <= auxTimerLoad - 1;
          end
          else if(auxTimerLoad==0) begin
            timeout <= 1;
          end
      end
      else begin
        timeout <= 0;
        auxTimerLoad <= timer_load;
      end

      timervalue <= auxTimerLoad;
    end 
  end
endmodule