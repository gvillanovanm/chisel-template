module UartTx(input clk, input reset,
    output io_txd,
    output io_enq_ready,
    input  io_enq_valid,
    input [7:0] io_enq_bits
);

  wire T0;
  reg [3:0] state;
  wire[3:0] T39;
  wire[3:0] T1;
  wire[3:0] T2;
  wire T3;
  wire T4;
  wire[3:0] T5;
  wire T6;
  wire T7;
  reg [12:0] count;
  wire[12:0] T40;
  wire[12:0] T8;
  wire[12:0] T9;
  wire[12:0] T10;
  wire[12:0] T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  reg [8:0] buf_;
  wire[8:0] T41;
  wire[8:0] T34;
  wire[8:0] T35;
  wire[8:0] T36;
  wire[8:0] T37;
  wire[7:0] T38;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    count = {1{$random}};
    buf_ = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_enq_ready = T0;
  assign T0 = state == 4'h0;
  assign T39 = reset ? 4'h0 : T1;
  assign T1 = T6 ? T5 : T2;
  assign T2 = T3 ? 4'ha : state;
  assign T3 = T4 & io_enq_valid;
  assign T4 = 4'h0 == state;
  assign T5 = state - 4'h1;
  assign T6 = T14 & T7;
  assign T7 = count == 13'h0;
  assign T40 = reset ? 13'h1adb : T8;
  assign T8 = T12 ? T11 : T9;
  assign T9 = T6 ? 13'h1adb : T10;
  assign T10 = T3 ? 13'h1adb : count;
  assign T11 = count - 13'h1;
  assign T12 = T14 & T13;
  assign T13 = T7 ^ 1'h1;
  assign T14 = T16 | T15;
  assign T15 = 4'ha == state;
  assign T16 = T18 | T17;
  assign T17 = 4'h9 == state;
  assign T18 = T20 | T19;
  assign T19 = 4'h8 == state;
  assign T20 = T22 | T21;
  assign T21 = 4'h7 == state;
  assign T22 = T24 | T23;
  assign T23 = 4'h6 == state;
  assign T24 = T26 | T25;
  assign T25 = 4'h5 == state;
  assign T26 = T28 | T27;
  assign T27 = 4'h4 == state;
  assign T28 = T30 | T29;
  assign T29 = 4'h3 == state;
  assign T30 = T32 | T31;
  assign T31 = 4'h2 == state;
  assign T32 = 4'h1 == state;
  assign io_txd = T33;
  assign T33 = buf_[0];
  assign T41 = reset ? 9'h1ff : T34;
  assign T34 = T6 ? T37 : T35;
  assign T35 = T3 ? T36 : buf_;
  assign T36 = {io_enq_bits, 1'h0};
  assign T37 = {1'h1, T38};
  assign T38 = buf_[8:1];

  always @(posedge clk) begin
    if(reset) begin
      state <= 4'h0;
    end else if(T6) begin
      state <= T5;
    end else if(T3) begin
      state <= 4'ha;
    end
    if(reset) begin
      count <= 13'h1adb;
    end else if(T12) begin
      count <= T11;
    end else if(T6) begin
      count <= 13'h1adb;
    end else if(T3) begin
      count <= 13'h1adb;
    end
    if(reset) begin
      buf_ <= 9'h1ff;
    end else if(T6) begin
      buf_ <= T37;
    end else if(T3) begin
      buf_ <= T36;
    end
  end
endmodule

module UartRx(input clk, input reset,
    input  io_rxd,
    input  io_deq_ready,
    output io_deq_valid,
    output[7:0] io_deq_bits
);

  wire[7:0] T0;
  reg [8:0] buf_;
  wire[8:0] T55;
  wire[8:0] T1;
  wire[8:0] T2;
  wire[7:0] T3;
  wire T4;
  wire T5;
  reg [12:0] count;
  wire[12:0] T56;
  wire[12:0] T6;
  wire[12:0] T7;
  wire[12:0] T8;
  wire[12:0] T9;
  wire[12:0] T10;
  wire[12:0] T11;
  wire[12:0] T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg [3:0] state;
  wire[3:0] T57;
  wire[3:0] T18;
  wire[3:0] T19;
  wire[3:0] T20;
  wire[3:0] T21;
  wire T22;
  wire T23;
  wire[12:0] T24;
  wire T25;
  wire T26;
  wire[12:0] T27;
  wire T28;
  wire T29;
  wire T30;
  wire[12:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  reg  valid;
  wire T58;
  wire T51;
  wire T52;
  wire T53;
  wire T54;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    buf_ = {1{$random}};
    count = {1{$random}};
    state = {1{$random}};
    valid = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_deq_bits = T0;
  assign T0 = buf_[7:0];
  assign T55 = reset ? 9'h0 : T1;
  assign T1 = T4 ? T2 : buf_;
  assign T2 = {io_rxd, T3};
  assign T3 = buf_[8:1];
  assign T4 = T34 & T5;
  assign T5 = count == 13'h0;
  assign T56 = reset ? 13'hd6d : T6;
  assign T6 = T32 ? T31 : T7;
  assign T7 = T28 ? T27 : T8;
  assign T8 = T25 ? T24 : T9;
  assign T9 = T4 ? 13'h1adb : T10;
  assign T10 = T22 ? 13'h1adb : T11;
  assign T11 = T13 ? T12 : count;
  assign T12 = count - 13'h1;
  assign T13 = T15 & T14;
  assign T14 = count != 13'h0;
  assign T15 = T17 & T16;
  assign T16 = io_rxd == 1'h0;
  assign T17 = 4'h0 == state;
  assign T57 = reset ? 4'h0 : T18;
  assign T18 = T28 ? 4'h0 : T19;
  assign T19 = T4 ? T21 : T20;
  assign T20 = T22 ? 4'ha : state;
  assign T21 = state - 4'h1;
  assign T22 = T15 & T23;
  assign T23 = T14 ^ 1'h1;
  assign T24 = count - 13'h1;
  assign T25 = T34 & T26;
  assign T26 = T5 ^ 1'h1;
  assign T27 = count - 13'h1;
  assign T28 = T30 & T29;
  assign T29 = count == 13'hd6d;
  assign T30 = 4'h1 == state;
  assign T31 = count - 13'h1;
  assign T32 = T30 & T33;
  assign T33 = T29 ^ 1'h1;
  assign T34 = T36 | T35;
  assign T35 = 4'ha == state;
  assign T36 = T38 | T37;
  assign T37 = 4'h9 == state;
  assign T38 = T40 | T39;
  assign T39 = 4'h8 == state;
  assign T40 = T42 | T41;
  assign T41 = 4'h7 == state;
  assign T42 = T44 | T43;
  assign T43 = 4'h6 == state;
  assign T44 = T46 | T45;
  assign T45 = 4'h5 == state;
  assign T46 = T48 | T47;
  assign T47 = 4'h4 == state;
  assign T48 = T50 | T49;
  assign T49 = 4'h3 == state;
  assign T50 = 4'h2 == state;
  assign io_deq_valid = valid;
  assign T58 = reset ? 1'h0 : T51;
  assign T51 = T28 ? 1'h1 : T52;
  assign T52 = T22 ? 1'h0 : T53;
  assign T53 = T54 ? 1'h0 : valid;
  assign T54 = valid & io_deq_ready;

  always @(posedge clk) begin
    if(reset) begin
      buf_ <= 9'h0;
    end else if(T4) begin
      buf_ <= T2;
    end
    if(reset) begin
      count <= 13'hd6d;
    end else if(T32) begin
      count <= T31;
    end else if(T28) begin
      count <= T27;
    end else if(T25) begin
      count <= T24;
    end else if(T4) begin
      count <= 13'h1adb;
    end else if(T22) begin
      count <= 13'h1adb;
    end else if(T13) begin
      count <= T12;
    end
    if(reset) begin
      state <= 4'h0;
    end else if(T28) begin
      state <= 4'h0;
    end else if(T4) begin
      state <= T21;
    end else if(T22) begin
      state <= 4'ha;
    end
    if(reset) begin
      valid <= 1'h0;
    end else if(T28) begin
      valid <= 1'h1;
    end else if(T22) begin
      valid <= 1'h0;
    end else if(T54) begin
      valid <= 1'h0;
    end
  end
endmodule

module Uart(input clk, input reset,
    output io_ctl_enq_ready,
    input  io_ctl_enq_valid,
    input [7:0] io_ctl_enq_bits,
    input  io_ctl_deq_ready,
    output io_ctl_deq_valid,
    output[7:0] io_ctl_deq_bits,
    output io_pins_txd,
    input  io_pins_rxd
);

  wire tx_io_txd;
  wire tx_io_enq_ready;
  wire rx_io_deq_valid;
  wire[7:0] rx_io_deq_bits;


  assign io_pins_txd = tx_io_txd;
  assign io_ctl_deq_bits = rx_io_deq_bits;
  assign io_ctl_deq_valid = rx_io_deq_valid;
  assign io_ctl_enq_ready = tx_io_enq_ready;
  UartTx tx(.clk(clk), .reset(reset),
       .io_txd( tx_io_txd ),
       .io_enq_ready( tx_io_enq_ready ),
       .io_enq_valid( io_ctl_enq_valid ),
       .io_enq_bits( io_ctl_enq_bits )
  );
  UartRx rx(.clk(clk), .reset(reset),
       .io_rxd( io_pins_rxd ),
       .io_deq_ready( io_ctl_deq_ready ),
       .io_deq_valid( rx_io_deq_valid ),
       .io_deq_bits( rx_io_deq_bits )
  );
endmodule

