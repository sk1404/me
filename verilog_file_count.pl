#!/usr/bin/perl
use strict;
use warnings;

# Check for input file
die "Usage: perl count_verilog_elements.pl <file.v>\n" unless @ARGV == 1;
my $file = $ARGV[0];

# Counters
my ($module_count, $always_count, $ff_count) = (0, 0, 0);

# Flip-flop module names to match (extend if needed)
my @ff_names = qw(DFF FDRE DFFR DFFS DFFSR);
my $ff_regex = join("|", @ff_names);

# Open Verilog file
open my $fh, '<', $file or die "Cannot open $file: $!";

while (<$fh>) {
    # Remove comments
    s|//.*||;

    # Count module declarations
    $module_count++ if /\bmodule\b/;

    # Count always blocks
    $always_count++ if /\balways\b/;

    # Count flip-flop instantiations
    $ff_count++ if /\b($ff_regex)\b/;
}

close $fh;

# Print results
print "Module declarations : $module_count\n";
print "Always blocks       : $always_count\n";
print "Flip-flop instances : $ff_count\n";




//example

module top;
  reg clk, rst, d;
  wire q;

  DFF dff1 (.clk(clk), .d(d), .q(q));
  FDRE fdre1 (.C(clk), .D(d), .Q(q), .R(rst));

  always @(posedge clk) begin
    // some logic
  end
endmodule


//output


Module declarations : 1
Always blocks       : 1
Flip-flop instances : 2
