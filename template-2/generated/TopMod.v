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
endmodule

