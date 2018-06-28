#
# Building Chisel examples without too much sbt/scala/... stuff
#
# sbt looks for default into a folder ./project and . for build.sdt and Build.scala
# sbt creates per default a ./target folder

SBT = sbt


# Generate Verilog code
test:
	$(SBT) "runMain test.TestMain"

switch:
	$(SBT) "runMain switch.AluMain"

bb:
	$(SBT) "runMain bb.BBMain"

timer:
	$(SBT) "runMain timer.TimerMain"

uart:
	$(SBT) "runMain uart.UartMain"

alu:
	$(SBT) "runMain simple.AluMain"

knight:
	$(SBT) "runMain simple.KnightMain"

old_uart:
	$(SBT) "runMain old_uart.UartMain"


# Generate the C++ simulation and run the tests

alu-test:
	$(SBT) "test:runMain simple.AluTester"

counter:
	$(SBT) "test:runMain simple.CounterTester"

knight-test:
	$(SBT) "test:runMain simple.KnightTester"

fifo-test:
	$(SBT) "test:runMain simple.FifoTester"

fifo-view:
	gtkwave generated/BubbleFifo.vcd --save=bubble.gtkw

fifo: fifo-test fifo-view


