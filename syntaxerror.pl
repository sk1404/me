#!/bin/bash

# Comment: Set folder path containing Verilog files
VERILOG_DIR="./verilog_files"   # <-- Change as needed

# Comment: Output log file for errors
LOG_FILE="syntax_errors.log"
> "$LOG_FILE"  # Clear the log file at start

echo "Checking Verilog syntax in folder: $VERILOG_DIR"

# Comment: Loop through all .v files in the folder
for file in "$VERILOG_DIR"/*.v; do
    echo "Compiling: $file"
    iverilog -t null "$file" 2>> "$LOG_FILE"
done

# Comment: Check if the log file contains errors
if [ -s "$LOG_FILE" ]; then
    echo "❌ Syntax errors found! Check the log file: $LOG_FILE"
else
    echo "✅ All Verilog files compiled successfully with no syntax errors."
    rm "$LOG_FILE"
fi
