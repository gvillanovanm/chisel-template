package foo

import Chisel._

class Foo(w: Int) extends Module {
  val io = IO(new Bundle{
    val result = UInt(OUTPUT, w)
    val a  = UInt(INPUT, w)
    val b  = UInt(INPUT, w)
    val fn = UInt(INPUT, 2)
  })
  // wires
  val result = UInt(width = 4)
  val a  = io.a
  val b  = io.b
  val fn = io.fn

  // default é obrigatório, diferente de Verilgo
  result := UInt(0)
  switch(fn) {
    is(0.U) { result := a + b }
    is(1.U) { result := a - b }
    is(2.U) { result := a | b }
    is(3.U) { result := a & b }
  }  

  // output
  io.result := result
}

object FooMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new Foo(8)))
  }
}
