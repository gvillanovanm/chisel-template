package bb

import Chisel._


/*******************************/
/*          BlackBox           */

/* 
module BB(..same if..)      
    ..verilog code..
*/
/*******************************/
class BB extends BlackBox {
  val io = new Bundle {
    //val clk    = Clock(INPUT)
    //val reset  = Bool(INPUT)
    val input  = UInt(INPUT, 32)
    val output = UInt(OUTPUT,32)
  }
}

class TopMod extends Module {
  val io = new Bundle {
    //val clk    = Clock(INPUT)
    //val reset  = Bool(INPUT)
    val input  = UInt(INPUT, 32)
    val output = UInt(OUTPUT,32)
  }

  /* 
  Some Module should creates the BlackBox and 
  connects it
  */
  val bb = Module(new BB)

 
  io <> bb.io
  /*
  bb.io.input := io.input 
  io.output   := bb.io.output 
  */
}

object BBMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new TopMod))
  }
}