#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Checkout the repository: Write a shell script that checks for syntax errors in a folder of Verilog files using `iverilog`.
# It should:
# - Compile each file
# - Redirect any errors to a log file
# - Display a final status message

my $verilog_dir = "./verilog_files";
my $log_file = "syntax_errors.log";

# Clear previous log file
open(my $log_fh, '>', $log_file) or die "Cannot open log file: $!";

# Check if directory exists
unless (-d $verilog_dir) {
    print "❌ Directory $verilog_dir not found!\n";
    exit 1;
}

print "🔍 Checking Verilog files for syntax errors...\n";

# Read .v files in directory
opendir(my $dh, $verilog_dir) or die "Can't open dir: $!";
my @files = grep { /\.v$/ && -f "$verilog_dir/$_" } readdir($dh);
closedir($dh);

# Compile each file with iverilog
foreach my $file (@files) {
    my $full_path = "$verilog_dir/$file";
    print "Checking: $file\n";
    my $output = `iverilog -t null "$full_path" 2>&1`;
    print $log_fh "$file:\n$output\n" if $output;
}

close($log_fh);

# Final status
if (-z $log_file) {
    print "✅ All Verilog files compiled without syntax errors!\n";
    unlink $log_file;
} else {
    print "❌ Syntax errors found. Check $log_file\n";
}
