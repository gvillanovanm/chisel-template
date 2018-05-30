package circuitscomb.fulladd

//import halfadd._ // ou import halfadd.halfadd (_ si2gnifica *)
import circuitscomb.halfadd._
import chisel3._

class fulladd extends Module
{
	val io = IO(new Bundle {
		val A 	= Input(Bool())
		val B 	= Input(Bool())
		val Cin = Input(Bool())
		val S   = Output(Bool())
		val C   = Output(Bool())
	})

	val halfadd0 = Module(new halfadd())
	halfadd0.io.a := io.A
	halfadd0.io.b := io.B

	val halfadd1 = Module(new halfadd())
	halfadd1.io.a := halfadd0.io.s
	halfadd1.io.b := io.Cin

	io.S := halfadd1.io.s
	io.C := halfadd0.io.c | halfadd1.io.c
}


object fulladddriver extends App {
  chisel3.Driver.execute(args, () => new fulladd)
}