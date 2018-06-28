package timer

import Chisel._


/*******************************/
/*           Timer             */
/*******************************/
class TimerModule(w: Int) extends Module {
  val io = IO(new Bundle {
    val enable     = Bool(INPUT)
    val timerLoad  = UInt(INPUT, w)
    val timeout    = Bool(OUTPUT)
    val timerValue = UInt(OUTPUT, width = w)
    
    /* Interrupts */
    val timerINT0  = Bool(OUTPUT)
    val timerINT1  = Bool(OUTPUT)
    val timerINT2  = Bool(OUTPUT)
    val timerINT3  = Bool(OUTPUT)
    val timerIntEnable = UInt(INPUT, width = w)
  })
  // aux variables 
  val auxTimerLoad = Reg(UInt(0, w))

  when (io.enable && (auxTimerLoad =/= UInt(0))) {
    auxTimerLoad := auxTimerLoad - UInt(1)
  } 
  .elsewhen (io.enable && (auxTimerLoad === UInt(0))) {
    io.timeout := Bool(true)
  }
  .otherwise {
    io.timeout   := Bool(false)
    auxTimerLoad := io.timerLoad
  }

  io.timerValue := auxTimerLoad

  /* Interrupts uses the timeout and timerIntEnable */ 
  io.timerINT0 := io.timeout && (io.timerIntEnable(UInt(0)))
  io.timerINT1 := io.timeout && (io.timerIntEnable(UInt(1)))
  io.timerINT2 := io.timeout && (io.timerIntEnable(UInt(2)))
  io.timerINT3 := io.timeout && (io.timerIntEnable(UInt(3)))

  println("\n\nTimer Compiled!\n\n")
  // printf("Hello world!\n") not work in sbt compilation
}

object TimerMain {
  def main(args: Array[String]): Unit = {
    chiselMain(Array[String]("--backend", "v", "--targetDir", "generated"),
      () => Module(new TimerModule(32)))
  }
}

