vdel -lib  ../libs/lib_VLOG -all

vlib ../libs/lib_VLOG

vmap lib_VLOG ../libs/lib_VLOG 

#vlog -work lib_VLOG Uart.v
#vlog -work lib_VLOG tb.v
#vlog -work lib_VLOG BB.v
#vlog -work lib_VLOG TopMod.v
vlog -work lib_VLOG BlackBoxModule.v
vlog -work lib_VLOG tb.v
