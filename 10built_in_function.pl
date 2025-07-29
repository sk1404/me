#!/usr/bin/perl
use strict;
use warnings;

# Scalar variable example (single value)
my $name = "Sheshadri";        # Scalar variable
# Built-in functions: length($name), uc($name), lc($name), index($name, 'a'), substr($name, 0, 4)
print "Hello, $name\n";

my $marks = 88;                # Scalar numeric
# Built-in functions: int($marks), sqrt($marks), sprintf("%.2f", $marks)
print "Marks: $marks\n";

# Array variable example (list of values)
my @colors = ("red", "green", "blue");   # Array
# Built-in functions: scalar @colors, push(@colors, 'yellow'), pop(@colors), shift, sort(@colors), reverse(@colors)
print "Colors: @colors\n";
print "First color: $colors[0]\n";        # Array indexing

# Hash variable example (key-value pairs)
my %student = (
    name => "Anu",
    usn  => "1BM24CS001"
);                         # Hash
# Built-in functions: keys(%student), values(%student), exists($student{key}), delete($student{key}), each(%student)
print "Student Name: $student{name}\n";
print "USN: $student{usn}\n";

# Use scalar to count array elements
my $count = scalar @colors;        # Forces scalar context to count elements
# Built-in: scalar(), also use $#colors + 1
print "Total colors: $count\n";

# Convert array to uppercase using map
my @upper = map { uc($_) } @colors;  # map applies function to each element
# Built-in functions used here: uc(), map()
print "Uppercase Colors: @upper\n";

# Loop through hash keys
foreach my $key (keys %student) {     # keys returns list of hash keys
    # Built-in functions: keys(), values(), exists(), each()
    print "$key => $student{$key}\n";
}

# User input with chomp
print "Enter a value: ";
chomp(my $input = <STDIN>);   # chomp removes trailing newline
# Built-in functions: chomp(), uc($input), lc($input), reverse($input)
print "You entered: $input\n";

# Use length() on a scalar
print "Length of name: ", length($name), "\n";  # length counts characters
