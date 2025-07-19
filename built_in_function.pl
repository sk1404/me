#!/usr/bin/perl
use strict;
use warnings;

# Scalar variable example (single value)
my $name = "Sheshadri";
print "Hello, $name\n";

my $marks = 88;
print "Marks: $marks\n";

# Array variable example (list of values)
my @colors = ("red", "green", "blue");
print "Colors: @colors\n";
print "First color: $colors[0]\n";

# Hash variable example (key-value pairs)
my %student = (
    name => "Anu",
    usn  => "1BM24CS001"
);
print "Student Name: $student{name}\n";
print "USN: $student{usn}\n";

# Use scalar to count array elements
my $count = scalar @colors;
print "Total colors: $count\n";

# Convert array to uppercase using map
my @upper = map { uc($_) } @colors;
print "Uppercase Colors: @upper\n";

# Loop through hash keys
foreach my $key (keys %student) {
    print "$key => $student{$key}\n";
}

# User input with chomp
print "Enter a value: ";
chomp(my $input = <STDIN>);
print "You entered: $input\n";

# Use length() on a scalar
print "Length of name: ", length($name), "\n";
