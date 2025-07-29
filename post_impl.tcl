# Open the implemented design
open_run impl_1


# 1. Generate overall timing summary
report_timing_summary \
  -delay_type min_max \
  -report_unconstrained \
  -check_timing_verbose \
  -max_paths 10 \
  -input_pins \
  -file timing_summary.rpt

# 2. Generate detailed failing paths (slack < 0)
report_timing \
  -delay_type max \
  -slack_lesser_than 0.0 \
  -max_paths 100 \
  -sort_by group \
  -input_pins \
  -routable_nets \
  -file failing_paths.rpt

# 3. Generate setup violations report
report_timing \
  -delay_type max \
  -setup \
  -slack_lesser_than 0.0 \
  -max_paths 1000 \
  -file setup_violations.rpt

# 4. Generate hold violations report
report_timing \
  -delay_type min \
  -hold \
  -slack_lesser_than 0.0 \
  -max_paths 1000 \
  -file hold_violations.rpt

# 5. Export all timing violations to CSV (optional analysis)
report_timing \
  -delay_type min_max \
  -slack_lesser_than 0.0 \
  -max_paths 1000 \
  -format csv \
  -file timing_violations.csv

# 6. Console messages
puts "📁 Timing reports generated successfully:"
puts " - timing_summary.rpt       → Overall timing summary"
puts " - failing_paths.rpt        → Failing timing paths (slack < 0)"
puts " - setup_violations.rpt     → Setup timing violations"
puts " - hold_violations.rpt      → Hold timing violations"
puts " - timing_violations.csv    → Violations in CSV format for analysis"
