# Checkout the repository: Write a Tcl script that automates the synthesis process for multiple RTL files stored in a directory.
# It should:
# - Loop through all `.v` files
# - Add them to a Vivado project
# - Launch synthesis
# - Export a report of synthesized modules

# Set project name and target directory
set proj_name auto_synth_proj
set top_module top      ;# Change this if you have a different top module
set rtl_dir ./rtl       ;# Folder containing your .v files
set part xc7z010clg400-1  ;# Change to match your FPGA part

# Create a new project
create_project $proj_name ./$proj_name -part $part
set_property top $top_module [current_fileset]

# Add all .v files from rtl_dir
foreach file [glob -nocomplain "$rtl_dir/*.v"] {
    add_files $file
}

# Launch synthesis
launch_runs synth_1 -jobs 4
wait_on_run synth_1

# Open synthesized design
open_run synth_1

# Generate synthesis report
report_utilization -file synth_report.rpt
report_timing_summary -file timing_summary.rpt

puts "✅ Synthesis completed. Reports saved in project folder."
