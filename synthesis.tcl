# Set project name and directory
set proj_name "auto_synth_project"
set top_module "top"  ;# Change this to your actual top module name
set src_dir "./rtl_files" ;# Folder containing your .v files

# Create new project
create_project $proj_name ./project_dir -part xc7a35tcpg236-1

# Add all Verilog (.v) files from the specified directory
foreach file [glob -nocomplain "$src_dir/*.v"] {
    add_files $file
}

# Set top module (required for synthesis)
set_property top $top_module [current_fileset]

# Run synthesis
launch_runs synth_1
wait_on_run synth_1

# Open synthesized design
open_run synth_1

# Export synthesis report
report_utilization -file synth_utilization.rpt
report_timing_summary -file synth_timing.rpt

# Final message
puts "✅ Synthesis completed. Reports generated:"
puts "  - synth_utilization.rpt"
puts "  - synth_timing.rpt"
