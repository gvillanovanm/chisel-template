# Packages
PACKAGE_GCD=gcd

# Output generate vlog
OUTPUT=output

compile:
	sbt compile
gen_vlog_gcd:
	sbt "run-main $(PACKAGE_GCD).gcddriver --target-dir=$(OUTPUT)"
test_gcd:
	sbt 'testOnly $(PACKAGE_GCD).GCDTester'
convert_vlog_cxx:
	verilator --cc output/gcdDriver.v
verilog_fulladd:
	sbt "runMain circuitscomb.fulladd.fulladddriver --target-dir=output"

clean:
	rm -rf test_run_dir
	rm -rf target
	rm -rf project/project
	rm -rf project/target
	rm -rf output
	rm -rf obj_dir