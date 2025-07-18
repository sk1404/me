use strict;
use warnings;
use Tk;
use Tk::Dialog;
use Cwd;

my $mw = MainWindow->new;
$mw->title("Verilog/XDC File Viewer");

# Browse Button
$mw->Button(
    -text => "Browse Folder",
    -command => \&browse_folder
)->pack(-pady => 10);

# Output Listbox
my $listbox = $mw->Scrolled("Listbox", -width => 70, -height => 20, -scrollbars => "e")
                 ->pack(-fill => 'both', -expand => 1);

# Status Label
my $status = $mw->Label(-text => "No folder selected")->pack(-fill => 'x');

sub browse_folder {
    my $dir = $mw->chooseDirectory(-initialdir => getcwd());
    return unless $dir;

    opendir(my $dh, $dir) or return;
    my @files = grep { /\.(v|xdc)$/i && -f "$dir/$_" } readdir($dh);
    closedir($dh);

    $listbox->delete(0, 'end');
    $status->configure(-text => "Found " . scalar(@files) . " .v/.xdc files");

    foreach my $file (@files) {
        my $size = -s "$dir/$file";
        $listbox->insert('end', "$file ($size bytes)");
    }

    # Double-click to open
    $listbox->bind('<Double-Button-1>' => sub {
        my $index = $listbox->curselection;
        return unless defined $index;
        my $line = $listbox->get($index);
        my ($filename) = $line =~ /^(.+?) \(/;
        open_file("$dir/$filename");
    });
}

sub open_file {
    my ($path) = @_;
    my $win = $mw->Toplevel();
    $win->title("Viewing: $path");

    my $text = $win->Scrolled("Text", -width => 80, -height => 25, -scrollbars => 'e')
                   ->pack(-fill => 'both', -expand => 1);

    if (open my $fh, '<', $path) {
        while (<$fh>) {
            $text->insert('end', $_);
        }
        close $fh;
    } else {
        $text->insert('end', "Unable to open file: $!");
    }
}

MainLoop;
