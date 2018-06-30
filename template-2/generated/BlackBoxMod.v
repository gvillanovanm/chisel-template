module BlackBoxMod(
    input  io_reset,
    input [31:0] io_input,
    output[31:0] io_output
);



`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_output = {1{$random}};
// synthesis translate_on
`endif
endmodule

