#unix% dc_shell -topo -f run.tcl | tee -i dc.log
#set hlo_resource_allocation area
#set_structure true
#set_flatten true -effort medium

#set_app_var target_library libs/typical.db
#set_app_var link_library "* $target_library"
#set_app_var symbol_library libs/symbol.sdb
read_verilog rtlmyCPU/alu.v
read_verilog rtlmyCPU/EXE_stage.v
read_verilog rtlmyCPU/ID_stage.v
read_verilog rtlmyCPU/IF_stage.v
read_verilog rtlmyCPU/MEM_stage.v
read_verilog rtlmyCPU/mycpu.h
read_verilog rtlmyCPU/regfile.v
read_verilog rtlmyCPU/tools.v
read_verilog rtlmyCPU/WB_stage.v
read_verilog rtlmyCPU/inst_sram.v
read_verilog rtlmyCPU/mulw.v
read_verilog rtlmyCPU/data_sram.v
read_verilog rtlmyCPU/mycpu_top.v
current_design mycpu_top
  

redirect -tee -file precompile.rpt {link}
redirect -append -tee -file precompile.rpt {check_design}
write -f ddc -hier -out unmapped/design.ddc
redirect -append -tee -file precompile.rpt {source ./top_design.con}
redirect -append -tee -file precompile.rpt {report_port -verbose}
redirect -append -tee -file precompile.rpt {report_clock -skew -attr}
redirect -append -tee -file precompile.rpt {check_timing}
compile_ultra
redirect -append -tee -file precompile.rpt {report_constraint -all_violators}
redirect -tee -file ./rpt/timing.rpt {report_timing -delay_type max}
redirect -append -tee -file ./rpt/timing.rpt {report_timing -delay_type min}
redirect -tee -file ./rpt/area.rpt {report_area -hierarchy}
redirect -tee -file ./rpt/power.rpt {report_power -analysis_effort high -verbose} 
redirect -tee -file ./rpt/qor.rpt {report_qor} 
write -format verilog -output mapped/design_mapped.v
write -f ddc -hier -out ./mapped/design_mapped.ddc
write_sdc ./mapped/my_constrains.sdc
write_sdf -version 2.1 ./mapped/a.sdf
