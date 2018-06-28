module Test(input clk, input reset,
    input  io_b,
    input  io_c,
    output io_s
);

  wire T0;
  reg  out;
  wire T5;
  wire T1;
  wire T2;
  wire T3;
  wire T4;

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
  assign T5 = reset ? 1'h0 : T1;
  assign T1 = T4 ? 1'h0 : T2;
  assign T2 = T3 ? 1'h1 : out;
  assign T3 = io_b | io_c;
  assign T4 = T3 ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      out <= 1'h0;
    end else if(T4) begin
      out <= 1'h0;
    end else if(T3) begin
      out <= 1'h1;
    end
  end
endmodule

