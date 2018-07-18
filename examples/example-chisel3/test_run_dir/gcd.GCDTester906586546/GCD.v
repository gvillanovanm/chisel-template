`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module GCD(
  input         clock,
  input         reset,
  input  [15:0] io_value1,
  input  [15:0] io_value2,
  input         io_loadingValues,
  output [15:0] io_outputGCD,
  output        io_outputValid
);
  reg [15:0] x; // @[GCD.scala 21:15]
  reg [31:0] _RAND_0;
  reg [15:0] y; // @[GCD.scala 22:15]
  reg [31:0] _RAND_1;
  wire  _T_9; // @[GCD.scala 24:10]
  wire [16:0] _T_10; // @[GCD.scala 24:24]
  wire [16:0] _T_11; // @[GCD.scala 24:24]
  wire [15:0] _T_12; // @[GCD.scala 24:24]
  wire [16:0] _T_13; // @[GCD.scala 25:25]
  wire [16:0] _T_14; // @[GCD.scala 25:25]
  wire [15:0] _T_15; // @[GCD.scala 25:25]
  wire [15:0] _GEN_0; // @[GCD.scala 24:15]
  wire [15:0] _GEN_1; // @[GCD.scala 24:15]
  wire [15:0] _GEN_2; // @[GCD.scala 27:26]
  wire [15:0] _GEN_3; // @[GCD.scala 27:26]
  wire  _T_17; // @[GCD.scala 33:23]
  assign _T_9 = x > y; // @[GCD.scala 24:10]
  assign _T_10 = x - y; // @[GCD.scala 24:24]
  assign _T_11 = $unsigned(_T_10); // @[GCD.scala 24:24]
  assign _T_12 = _T_11[15:0]; // @[GCD.scala 24:24]
  assign _T_13 = y - x; // @[GCD.scala 25:25]
  assign _T_14 = $unsigned(_T_13); // @[GCD.scala 25:25]
  assign _T_15 = _T_14[15:0]; // @[GCD.scala 25:25]
  assign _GEN_0 = _T_9 ? _T_12 : x; // @[GCD.scala 24:15]
  assign _GEN_1 = _T_9 ? y : _T_15; // @[GCD.scala 24:15]
  assign _GEN_2 = io_loadingValues ? io_value1 : _GEN_0; // @[GCD.scala 27:26]
  assign _GEN_3 = io_loadingValues ? io_value2 : _GEN_1; // @[GCD.scala 27:26]
  assign _T_17 = y == 16'h0; // @[GCD.scala 33:23]
  assign io_outputGCD = x;
  assign io_outputValid = _T_17;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  x = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  y = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_loadingValues) begin
      x <= io_value1;
    end else begin
      if (_T_9) begin
        x <= _T_12;
      end
    end
    if (io_loadingValues) begin
      y <= io_value2;
    end else begin
      if (!(_T_9)) begin
        y <= _T_15;
      end
    end
  end
endmodule
