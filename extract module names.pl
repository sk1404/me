#!/usr/bin/perl
use strict;
use warnings;

open(my $in, "<", "design.v") or die "Can't open file: $!";
open(my $out, ">", "output.csv") or die "Can't write to output.csv";

print $out "Module,Direction,Port\n";

my $module;

while (<$in>) {
    if (/module\s+(\w+)/) {
        $module = $1;
    }

    if (/input\s+(.*);/) {
        my $line = $1;
        $line =~ s/\[[^\]]+\]//g;  # remove bit-widths
        my @ports = split(/\s*,\s*/, $line);
        foreach my $p (@ports) {
            $p =~ s/^\s+|\s+$//g;
            print $out "$module,input,$p\n" if $p;
        }
    }

    if (/output\s+(.*);/) {
        my $line = $1;
        $line =~ s/\[[^\]]+\]//g;
        my @ports = split(/\s*,\s*/, $line);
        foreach my $p (@ports) {
            $p =~ s/^\s+|\s+$//g;
            print $out "$module,output,$p\n" if $p;
        }
    }
}

close($in);
close($out);

print "Done. See output.csv\n";
