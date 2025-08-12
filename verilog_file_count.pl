#!/usr/bin/perl
use strict;
use warnings;

# Check if file is given
if (@ARGV != 1) {
    die "Usage: $0 <verilog_file>\n";
}

my $filename = $ARGV[0];

open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my $module_count = 0;
my $always_count = 0;
my $ff_count = 0;

while (my $line = <$fh>) {
    chomp $line;
    
    # Remove comments for clean matching
    $line =~ s/\/\/.*//;           # Single-line comments
    $line =~ s/\/\*.*?\*\///g;     # Inline block comments
    
    # Count module declarations
    $module_count++ if ($line =~ /\bmodule\b/);
    
    # Count always blocks
    $always_count++ if ($line =~ /\balways\b/);
    
    # Count flip-flop instances (case-insensitive)
    $ff_count++ if ($line =~ /\b(DFF|FDRE)\b/i);
}

close $fh;

print "Summary for file: $filename\n";
print "Modules found: $module_count\n";
print "Always blocks found: $always_count\n";
print "Flip-flop instances found: $ff_count\n";
