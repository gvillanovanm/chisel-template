module TimerModule(input clk,
    input  io_enable,
    input [31:0] io_timerLoad,
    output io_timeout,
    output[31:0] io_timerValue,
    output io_timerINT0,
    output io_timerINT1,
    output io_timerINT2,
    output io_timerINT3,
    input [31:0] io_timerIntEnable
);

  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg [31:0] auxTimerLoad;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    auxTimerLoad = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_timerINT3 = T0;
  assign T0 = io_timeout & T1;
  assign T1 = io_timerIntEnable[3];
  assign io_timerINT2 = T2;
  assign T2 = io_timeout & T3;
  assign T3 = io_timerIntEnable[2];
  assign io_timerINT1 = T4;
  assign T4 = io_timeout & T5;
  assign T5 = io_timerIntEnable[1];
  assign io_timerINT0 = T6;
  assign T6 = io_timeout & T7;
  assign T7 = io_timerIntEnable[0];
  assign io_timerValue = auxTimerLoad;
  assign T8 = T13 ? io_timerLoad : T9;
  assign T9 = T11 ? T10 : auxTimerLoad;
  assign T10 = auxTimerLoad - 32'h1;
  assign T11 = io_enable & T12;
  assign T12 = auxTimerLoad != 32'h0;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T11 | T15;
  assign T15 = io_enable & T16;
  assign T16 = auxTimerLoad == 32'h0;
  assign io_timeout = T17;
  assign T17 = T18 ? 1'h1 : 1'h0;
  assign T18 = T19 & T15;
  assign T19 = T11 ^ 1'h1;

  always @(posedge clk) begin
    if(T13) begin
      auxTimerLoad <= io_timerLoad;
    end else if(T11) begin
      auxTimerLoad <= T10;
    end
  end
endmodule

