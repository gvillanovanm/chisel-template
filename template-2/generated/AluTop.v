module Alu(
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
  wire[3:0] T6;
  wire T7;
  wire[3:0] T8;
  wire T9;
  wire[3:0] T10;
  wire T11;


  assign io_result = result;
  assign result = T0;
  assign T0 = T11 ? T10 : T1;
  assign T1 = T9 ? T8 : T2;
  assign T2 = T7 ? T6 : T3;
  assign T3 = T5 ? T4 : 4'h0;
  assign T4 = io_a + io_b;
  assign T5 = 2'h0 == io_fn;
  assign T6 = io_a - io_b;
  assign T7 = 2'h1 == io_fn;
  assign T8 = io_a | io_b;
  assign T9 = 2'h2 == io_fn;
  assign T10 = io_a & io_b;
  assign T11 = 2'h3 == io_fn;
endmodule

module AluTop(
    input [9:0] io_sw,
    output[9:0] io_led
);

  wire[3:0] T0;
  wire[3:0] T1;
  wire[1:0] T2;
  wire[9:0] T3;
  wire[3:0] alu_io_result;


  assign T0 = io_sw[9:6];
  assign T1 = io_sw[5:2];
  assign T2 = io_sw[1:0];
  assign io_led = T3;
  assign T3 = {6'h0, alu_io_result};
  Alu alu(
       .io_fn( T2 ),
       .io_a( T1 ),
       .io_b( T0 ),
       .io_result( alu_io_result )
  );
endmodule

