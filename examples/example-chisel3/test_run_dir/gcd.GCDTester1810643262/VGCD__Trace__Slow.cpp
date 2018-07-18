// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VGCD__Syms.h"


//======================

void VGCD::trace (VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback (&VGCD::traceInit, &VGCD::traceFull, &VGCD::traceChg, this);
}
void VGCD::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    VGCD* t=(VGCD*)userthis;
    VGCD__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) vl_fatal(__FILE__,__LINE__,__FILE__,"Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    vcdp->scopeEscape(' ');
    t->traceInitThis (vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void VGCD::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    VGCD* t=(VGCD*)userthis;
    VGCD__Syms* __restrict vlSymsp = t->__VlSymsp; // Setup global symbol table
    t->traceFullThis (vlSymsp, vcdp, code);
}

//======================


void VGCD::traceInitThis(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    vcdp->module(vlSymsp->name()); // Setup signal names
    // Body
    {
	vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void VGCD::traceFullThis(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void VGCD::traceInitThis__1(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->declBit  (c+3,"clock",-1);
	vcdp->declBit  (c+4,"reset",-1);
	vcdp->declBus  (c+5,"io_value1",-1,15,0);
	vcdp->declBus  (c+6,"io_value2",-1,15,0);
	vcdp->declBit  (c+7,"io_loadingValues",-1);
	vcdp->declBus  (c+8,"io_outputGCD",-1,15,0);
	vcdp->declBit  (c+9,"io_outputValid",-1);
	vcdp->declBit  (c+3,"GCD clock",-1);
	vcdp->declBit  (c+4,"GCD reset",-1);
	vcdp->declBus  (c+5,"GCD io_value1",-1,15,0);
	vcdp->declBus  (c+6,"GCD io_value2",-1,15,0);
	vcdp->declBit  (c+7,"GCD io_loadingValues",-1);
	vcdp->declBus  (c+8,"GCD io_outputGCD",-1,15,0);
	vcdp->declBit  (c+9,"GCD io_outputValid",-1);
	vcdp->declBus  (c+1,"GCD x",-1,15,0);
	// Tracing: GCD _RAND_0 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:24
	vcdp->declBus  (c+2,"GCD y",-1,15,0);
	// Tracing: GCD _RAND_1 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:26
	// Tracing: GCD _T_9 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:27
	// Tracing: GCD _T_10 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:28
	// Tracing: GCD _T_11 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:29
	// Tracing: GCD _T_12 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:30
	// Tracing: GCD _T_13 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:31
	// Tracing: GCD _T_14 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:32
	// Tracing: GCD _T_15 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:33
	// Tracing: GCD _GEN_0 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:34
	// Tracing: GCD _GEN_1 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:35
	// Tracing: GCD _GEN_2 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:36
	// Tracing: GCD _GEN_3 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:37
	// Tracing: GCD _T_17 // Ignored: Inlined leading underscore at /home/gvillanova/Engineering/developer/hw/systemverilog/workspace/rocket-chip/chisel/template-1/test_run_dir/gcd.GCDTester1810643262/GCD.v:38
    }
}

void VGCD::traceFullThis__1(VGCD__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    VGCD* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c=code;
    if (0 && vcdp && c) {}  // Prevent unused
    // Body
    {
	vcdp->fullBus  (c+1,(vlTOPp->GCD__DOT__x),16);
	vcdp->fullBus  (c+2,(vlTOPp->GCD__DOT__y),16);
	vcdp->fullBit  (c+3,(vlTOPp->clock));
	vcdp->fullBit  (c+4,(vlTOPp->reset));
	vcdp->fullBus  (c+5,(vlTOPp->io_value1),16);
	vcdp->fullBus  (c+6,(vlTOPp->io_value2),16);
	vcdp->fullBit  (c+7,(vlTOPp->io_loadingValues));
	vcdp->fullBus  (c+8,(vlTOPp->io_outputGCD),16);
	vcdp->fullBit  (c+9,(vlTOPp->io_outputValid));
    }
}
