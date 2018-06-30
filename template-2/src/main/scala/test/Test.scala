package test

import Chisel._

class Test extends Module {
	val io = IO(new Bundle {
	 //val Clock = Bool(INPUT)
	 val b = Bool(INPUT)
	 val c = Bool(INPUT)
	 val s = Bool(OUTPUT)
	})
	// default THIS NOT MAKES A CLOCK:
	/*
	io.s := UInt(0)
	
	when(io.Clock) {
		when(io.b || io.c) {
			io.s := UInt(1)
		}
		.otherwise {
			io.s := UInt(0)
		}
	}
	*/

	// THIS PUT A CLOCK IN WHEN
	/*
	val out = Reg(init = UInt(0, 1))

	when(io.b || io.c) {
		out := UInt(1)
	}
	.otherwise {
		out := UInt(0)
	}
	io.s := out
	*/
	
	// The same of when:
	val out = Reg(init = UInt(0, 1))
	switch(io.b||io.c) {
		is(UInt(0)) {out := UInt(0)}
		is(UInt(1)) {out := UInt(1)}
	}
	io.s := out
}

object TestMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new Test))
  }
}