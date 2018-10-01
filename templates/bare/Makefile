# Compiler
SBT = sbt

# Compile Chisel HDL
compile_foo:
	sbt compile

# Generate Verilog code
verilog_foo:
	$(SBT) "runMain foo.FooMain"

# Generate the C++ simulation and run the tests
simulator_foo:
	$(SBT) "test:runMain foo.FooTester"

clean:
	rm -rf test_run_dir
	rm -rf target
	rm -rf project
	rm -rf generated
	rm -rf output
	rm -rf obj_dir
