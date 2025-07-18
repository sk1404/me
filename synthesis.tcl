# Create a new project
create_project my_project ./my_project -part xc7a35tcpg236-1

# Add all Verilog (.v) files from the current folder
foreach file [glob *.v] {
    add_files $file
    puts "Added: $file"
}

# Set top module name (change "top" to your actual top module name)
set_property top top [current_fileset]

# Run synthesis
launch_runs synth_1
wait_on_run synth_1

# Open synthesized result
open_run synth_1

# Save reports
report_utilization -file utilization.txt
report_timing_summary -file timing.txt

puts "Synthesis done. Reports saved."
