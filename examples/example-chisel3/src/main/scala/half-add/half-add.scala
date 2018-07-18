/*******************************
 * As classes desse código
 * serão referenciadas por
 * esse package
 *******************************/
package circuitscomb.halfadd

/*******************************
 * Importamos as classes chisel3
 * que contém as classes bases p/
 * desenvolvimento de hw
 *******************************/
import chisel3._
//import chisel3.util._

class halfadd extends Module
{
	val io = IO(new Bundle {
		val a = Input(Bool())
		val b = Input(Bool())
		val s = Output(Bool())
		val c = Output(Bool())
	})
	// obs0: com a classe Bundle pode-se criar um conjunto
	// de tipos, é como se fosse um struct em C


	io.s := io.a ^ io.b
	io.c := io.a & io.b
	// obs1: o simbolo do igual '=' é para definir valores/variaveis/etc
	// o simbolo := é reservado para expressões
}


object halfadddriver extends App {
  chisel3.Driver.execute(args, () => new halfadd)
}
