 # Generate post-implementation timing report # Generate post-implementation timing report
 report_timing_summary report_timing_summary --delay_type min_max delay_type min_max --report_unconstrained report_unconstrained --check_timing_verbose check_timing_verbose --max_paths 10 max_paths 10 --input_pins input_pins
 # Generate detailed timing report for failing paths only # Generate detailed timing report for failing paths only
 report_timing report_timing --delay_type max delay_type max --max_paths 100 max_paths 100 --slack_lesser_than 0.0 slack_lesser_than 0.0 --sort_by group sort_by group --input_pins input_pins --routable_nets routable_nets --file fai file fai
 # Export only setup violations # Export only setup violations
 report_timing report_timing --delay_type max delay_type max --setup setup --max_paths 1000 max_paths 1000 --slack_lesser_than 0.0 slack_lesser_than 0.0 --file setup_violations.rpt file setup_violations.rpt
 # Export only hold violations  # Export only hold violations  
report_timing report_timing --delay_type min delay_type min --hold hold --max_paths 1000 max_paths 1000 --slack_lesser_than 0.0 slack_lesser_than 0.0 --file hold_violations.rpt file hold_violations.rpt
 # Generate timing report in CSV format for further analysis # Generate timing report in CSV format for further analysis
 report_timing report_timing --delay_type min_max delay_type min_max --max_paths 1000 max_paths 1000 --slack_lesser_than 0.0 slack_lesser_than 0.0 --format csv format csv --file timing_violations.csv file timing_violations.csv
 puts puts  "Timing reports generated:" "Timing reports generated:"
 puts puts  "- timing_summary.rpt: Complete timing summary" "- timing_summary.rpt: Complete timing summary"
 puts puts  "- failing_paths.rpt: Detailed failing paths" "- failing_paths.rpt: Detailed failing paths"
 puts puts  "- setup_violations.rpt: Setup violations only" "- setup_violations.rpt: Setup violations only"
 puts puts  "- hold_violations.rpt: Hold violations only" "- hold_violations.rpt: Hold violations only"
 puts puts  "- timing_violations.csv: CSV format for analysis
