module BB(
    input [31:0] io_input,
    output[31:0] io_output
);



`ifndef SYNTHESIS
// synthesis translate_off
  assign io_output = {1{$random}};
// synthesis translate_on
`endif
endmodule

module TopMod(
    input [31:0] io_input,
    output[31:0] io_output
);

  wire[31:0] bb_io_output;


  assign io_output = bb_io_output;
  BB bb(
       .io_input( io_input ),
       .io_output( bb_io_output )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign bb.io_output = {1{$random}};
// synthesis translate_on
`endif
endmodule

