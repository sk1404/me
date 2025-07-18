#!/usr/bin/perl
use strict;
use warnings;

# Input Verilog file (change as needed)
my $verilog_file = 'design.v';

# Counters
my ($module_count, $always_count, $flipflop_count) = (0, 0, 0);

# Open the file
open(my $fh, '<', $verilog_file) or die "Cannot open $verilog_file: $!";

while (my $line = <$fh>) {
    $module_count++    if $line =~ /^\s*module\b/;
    $always_count++    if $line =~ /^\s*always\b/;
    $flipflop_count++  if $line =~ /\b(DFF|FDRE)\b/;
}

close $fh;

# Display results
print "Module Declarations : $module_count\n";
print "Always Blocks       : $always_count\n";
print "Flip-Flop Instances : $flipflop_count\n";
