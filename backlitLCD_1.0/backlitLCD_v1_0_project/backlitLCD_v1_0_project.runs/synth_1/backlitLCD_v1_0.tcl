# 
# Synthesis run script generated by Vivado
# 

  set_param gui.test TreeTableDev
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1
set_property target_language Verilog [current_project]
set_param project.compositeFile.enableAutoGeneration 0
set_property default_lib xil_defaultlib [current_project]
set_property ip_repo_paths {
  /usr9/research/chsegal/Documents/ECE153A/Artix7/managedIP/ip_repo/backlitLCD_1.0
  /usr9/research/chsegal/Documents/ECE153A/Artix7/seven/ip_repo/sevenSeg_1.0
} [current_fileset]
read_verilog -library xil_defaultlib {
  /usr9/research/chsegal/Documents/ECE153A/Artix7/managedIP/ip_repo/backlitLCD_1.0/hdl/backlitLCD_v1_0_S_AXI.v
  /usr9/research/chsegal/Documents/ECE153A/Artix7/managedIP/ip_repo/backlitLCD_1.0/hdl/backlitLCD_v1_0.v
}
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /usr9/research/chsegal/Documents/ECE153A/Artix7/managedIP/ip_repo/backlitLCD_1.0/backlitLCD_v1_0_project/backlitLCD_v1_0_project.cache/wt [current_project]
set_property parent.project_dir /usr9/research/chsegal/Documents/ECE153A/Artix7/managedIP/ip_repo/backlitLCD_1.0/backlitLCD_v1_0_project [current_project]
synth_design -top backlitLCD_v1_0 -part xc7a100tcsg324-1
write_checkpoint backlitLCD_v1_0.dcp
report_utilization -file backlitLCD_v1_0_utilization_synth.rpt -pb backlitLCD_v1_0_utilization_synth.pb