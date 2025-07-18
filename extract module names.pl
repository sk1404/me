open(F, "design.v") or die "Can't open file";
open(O, ">output.csv");

print O "Module,Direction,Port\n";

while(<F>) {
    if (/module\s+(\w+)/) {
        $module = $1;
    }
    if (/input\s+(.*);/) {
        @ports = split(",", $1);
        foreach $p (@ports) {
            $p =~ s/[\[\]\d:\s]//g;  # clean brackets and spaces
            print O "$module,input,$p\n";
        }
    }
    if (/output\s+(.*);/) {
        @ports = split(",", $1);
        foreach $p (@ports) {
            $p =~ s/[\[\]\d:\s]//g;
            print O "$module,output,$p\n";
        }
    }
}

close(F);
close(O);

print "Done. See output.csv\n";
