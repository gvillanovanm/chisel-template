module Test(input clk, input reset,
    input  io_b,
    input  io_c,
    output io_s
);

  wire T0;
  reg  out;
  wire T6;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    out = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_s = T0;
  assign T0 = out;
  assign T6 = reset ? 1'h0 : T1;
  assign T1 = T5 ? 1'h1 : T2;
  assign T2 = T3 ? 1'h0 : out;
  assign T3 = 1'h0 == T4;
  assign T4 = io_b | io_c;
  assign T5 = 1'h1 == T4;

  always @(posedge clk) begin
    if(reset) begin
      out <= 1'h0;
    end else if(T5) begin
      out <= 1'h1;
    end else if(T3) begin
      out <= 1'h0;
    end
  end
endmodule

