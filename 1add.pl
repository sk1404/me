#!/usr/bin/perl
use strict;
use warnings;

# Take two numbers from user input or command-line args
my ($num1, $num2) = @ARGV;

# Check if both numbers are provided
die "Usage: perl run_add.pl <num1> <num2>\n" unless defined $num1 && defined $num2;

# Run the binary and capture the output
my $output = `./add $num1 $num2`;

# Print the output from the C program
print "Output from C program: $output";
