#!/usr/bin/perl
use strict;
use warnings;

# Scalar variable (single value)
my $name = "Ravi";               # Functions: length, uc, lc
print "Name: $name\n";
print "Name in uppercase: ", uc($name), "\n";

# Numeric scalar
my $age = 21;                    # Functions: int, sqrt
print "Age: $age, Square root: ", sqrt($age), "\n";

# Array variable (list of values)
my @colors = ("red", "blue");    # Functions: push, pop, sort
push(@colors, "green");
print "Colors: @colors\n";
print "Sorted: ", join(", ", sort @colors), "\n";

# Hash variable (key-value pairs)
my %student = ("name" => "Anu", "usn" => "1BM24CS001"); # Functions: keys, values, exists
print "Student name: $student{name}\n";

# User input and chomp()
print "Enter your city: ";
chomp(my $city = <STDIN>);       # chomp removes newline
print "City entered: $city\n";

# Loop through array
foreach my $color (@colors) {
    print "Color: $color\n";
}
