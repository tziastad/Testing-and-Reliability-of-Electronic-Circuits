transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/trcut.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/SDFF.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/MyDFF.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/comb_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/LFSR_8.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/TRCUTwithLFSR.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/misr_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/TRCUTwithMISR.v}

vlog -vlog01compat -work work +incdir+C:/Users/Dora/Desktop/tenentes/exercise_2 {C:/Users/Dora/Desktop/tenentes/exercise_2/TRCUTwithMISR_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  TRCUTwithMISR_tb

add wave *
view structure
view signals
run -all
