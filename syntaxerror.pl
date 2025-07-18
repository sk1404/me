#!/bin/bash

#--------------------------------------------
# Script to check Verilog syntax using iverilog
# - Compiles each .v file in current directory
# - Logs errors to syntax_errors.log
# - Displays a summary status
#--------------------------------------------

LOG_FILE="syntax_errors.log"
> "$LOG_FILE"  # Clear previous log

FILES_FOUND=false

for file in *.v; do
  if [ -f "$file" ]; then
    FILES_FOUND=true
    echo "Checking: $file"
    iverilog -t null "$file" 2>> "$LOG_FILE"
  fi
done

if ! $FILES_FOUND; then
  echo "⚠️ No Verilog (.v) files found in the current directory."
  exit 1
fi

if [ -s "$LOG_FILE" ]; then
  echo "❌ Syntax errors detected. Check '$LOG_FILE' for details."
else
  echo "✅ All Verilog files compiled successfully (no syntax errors)."
  rm "$LOG_FILE"
fi
