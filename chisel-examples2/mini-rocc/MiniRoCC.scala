class muxA extends Module {
  val io = IO(new Bundle {
    val reg0 = UInt(INPUT, width = xLen)
    val reg1 = UInt(INPUT, width = xLen)
    val reg2 = UInt(INPUT, width = xLen)
    val reg3 = UInt(INPUT, width = xLen)
    val sel  = UInt(INPUT, width = 2)
    val out  = UInt(OUTPUT, width = xLen)
  })
  
  io.out := Mux(sel, reg0, reg1, reg2, reg3)
}

class muxB extends Module {
  val io = IO(new Bundle {
    val reg0 = UInt(INPUT, width = xLen)
    val reg1 = UInt(INPUT, width = xLen)
    val reg2 = UInt(INPUT, width = xLen)
    val reg3 = UInt(INPUT, width = xLen)
    val sel  = UInt(INPUT, width = 2)
    val out  = UInt(OUTPUT, width = xLen)
  })
  
  io.out := Mux(sel, reg0, reg1, reg2, reg3)
}

class ULA extends Module {
  val io = IO(new Bundle {
    val ra = UInt(INPUT, width = xLen)
    val rb = UInt(INPUT, width = xLen)
    val rs1 = UInt(INPUT, width = xLen)
    val rs2 = UInt(INPUT, width = xLen)
    val sel_regResult = UInt(INPUT, width = 2)
    val op = UInt(INPUT, width = 2)

    val done = Bool(OUTPUT)
    val update_rb = UInt(OUTPUT, width = xLen)
    val result = UInt(OUTPUT, width = xLen)
  })
  /* wires */
  val result = UInt(width = xLen)
  val update_rb = UInt(width = xLen)
  val done = Bool()

  /* Combinational */
  switch(op) {
    is(UInt(0)) { // move
      result := Mux(io.sel_regResult, io.ra, io.rb, io.rs1, io.rs2)
    }
    is(UInt(1)) { // mul 
      result := io.ra + io.rb
      update_rb := io.rb - UInt(1)
    }
    is(UInt(2)) { // inc
      result := io.ra + UInt(1)
    }
    is(UInt(3)) { // zero
      result := UInt(0)
    }
  }

  io.result := result
  io.done := (update_rb === UInt(0)) && (op === UInt(1))
  io.update_rb := update_rb
}

class RegisterFile extends Module {
  val io = IO(new Bundle {
    val in_result = UInt(INPUT, width = xLen)
    val wr_en = Bool(INPUT)
    val mul_op = Bool(INPUT)
    val addr_regFile = UInt(INPUT, width = 2)
    val sel_rd = Bool(INPUT)
    val done = Bool(INPUT)
    val clear = Bool(INPUT)
    val regs = Mem(5, UInt(width = xLen))
  })

  when(io.wr_en) {
    switch
    io.regs(addr_regFile) := in_result
  }
}