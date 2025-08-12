#!/bin/bash

# Create or clear the log file
echo "" > verilog_errors.log

# Initialize counters
total=0
pass=0
fail=0

echo "Checking Verilog files for syntax errors..."

# Loop through all .v files in current folder
for file in *.v
do
  if [ -f "$file" ]; then
    total=$((total + 1))
    echo "Checking $file..."

    # Use iverilog to compile, send errors to log
    iverilog -t null "$file" 2>> verilog_errors.log

    if [ $? -eq 0 ]; then
      echo "$file: OK"
      pass=$((pass + 1))
    else
      echo "$file: ERROR (see log)"
      fail=$((fail + 1))
    fi
  fi
done

# Final summary
echo ""
echo "Total files : $total"
echo "Passed      : $pass"
echo "Failed      : $fail"
echo "Log file    : verilog_errors.log"

if [ $fail -eq 0 ]; then
  echo "✅ All files compiled successfully!"
else
  echo "⚠️ Some files have syntax errors."
fi




















Checking Verilog files for syntax errors...
Checking asss.v...
asss.v: ERROR (see log)
Checking scount.v...
scount.v: ERROR (see log)
Checking sddasdf.v...
sddasdf.v: ERROR (see log)
Checking sdfg.v...
sdfg.v: ERROR (see log)

Total files : 4
Passed      : 0
Failed      : 4
Log file    : verilog_errors.log
⚠️ Some files have syntax errors.
