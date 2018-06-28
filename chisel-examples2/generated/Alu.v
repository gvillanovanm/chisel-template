module Alu(
    input  io_start,
    input [1:0] io_fn,
    input [3:0] io_a,
    input [3:0] io_b,
    output[3:0] io_result
);

  wire[3:0] result;
  wire[3:0] T0;
  wire[3:0] T1;
  wire[3:0] T2;
  wire[3:0] T3;
  wire[3:0] T4;
  wire T5;
  wire T6;
  wire[3:0] T7;
  wire T8;
  wire T9;
  wire[3:0] T10;
  wire T11;
  wire T12;
  wire[3:0] T13;
  wire T14;
  wire T15;


  assign io_result = result;
  assign result = T0;
  assign T0 = T14 ? T13 : T1;
  assign T1 = T11 ? T10 : T2;
  assign T2 = T8 ? T7 : T3;
  assign T3 = T5 ? T4 : 4'h0;
  assign T4 = io_a + io_b;
  assign T5 = io_start & T6;
  assign T6 = 2'h0 == io_fn;
  assign T7 = io_a - io_b;
  assign T8 = io_start & T9;
  assign T9 = 2'h1 == io_fn;
  assign T10 = io_a | io_b;
  assign T11 = io_start & T12;
  assign T12 = 2'h2 == io_fn;
  assign T13 = io_a & io_b;
  assign T14 = io_start & T15;
  assign T15 = 2'h3 == io_fn;
endmodule

