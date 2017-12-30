package PerlBegin::TopicsExamples::FilesAndDirs;

use PerlBegin::TopicsExamples;

use strict;
use warnings;

sub _run
{
    my ($class) = @_;

    # Examples generator:
    my $ex_gen = PerlBegin::TopicsExamples->new(
        {
            default_syntax => 'perl',
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Reading a file line by line",
            id_base  => "reading_a_file_line_by_line",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

my $filename_to_read = 'my-file.txt';

my $fh = io->file($filename_to_read);
while (my $line = $fh->chomp->getline())
{
    # Do something with $line.
}
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;

my $filename_to_read = 'my-file.txt';

open my $fh, '<', $filename_to_read;
while (my $line = <$fh>)
{
    chomp($line);

    # Do something with $line.
}
close($fh);
EOF
                },
            ],
        }
    );
    print $ex_gen->html_with_title(
        {
            title    => "Copying a file",
            id_base  => "copying_a_file",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

my ($source_filename, $dest_filename) = @_;
io->file($source_filename) > io->file($dest_filename);
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use File::Copy qw(copy);

my ($source_filename, $dest_filename) = @_;

copy($source_filename, $dest_filename);
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Overwriting a file with text",
            id_base  => "overwrite_a_file",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

io->file("output.txt")->utf8->print("Hello World!\n");
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;

open my $out, '>:encoding(utf8)', "output.txt";
print {$out} "Hello World!\n";
close($out);
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Processing the Lines of a File",
            id_base  => "processing_lines_of_a_file",
            examples => [
                {
                    id    => "path_tiny",
                    label => "Path::Tiny",
                    code  => <<'EOF',
use Path::Tiny qw/ path /;

my @filenames = @ARGV;

foreach my $fn (@filenames)
{
    path($fn)->edit_lines_utf8(sub { s/\bFrom\b/To/g; });
}
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;
use File::Temp ( qw(tempfile) );

my @filenames = @ARGV;

foreach my $fn (@filenames)
{
    open my $in, '<', $fn;
    my ($tempout, $temp_fn) = tempfile();

    while (my $line = <$in>)
    {
        chomp($line);
        # Perform the operation here.
        $line =~ s/\bFrom\b/To/g;

        print {$tempout} "$new_line\n";
    }

    close($in);
    close($tempout);

    rename($temp_fn, $fn);
}
EOF
                },
                {
                    id        => "cmd_line",
                    label     => "Command Line",
                    no_syntax => 1,
                    code      => <<'EOF',
$ perl -i.bak -lp -e 's/\bFrom\b/To/g' *.txt
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Reading an entire UTF-8 file into a big variable",
            id_base  => "string_slurp_utf8",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

my $string = io->file($my_filepath)->utf8->all;
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;

sub _utf8_slurp
{
    my $filename = shift;

    open my $in, '<:encoding(utf8)', $filename;

    local $/;
    my $contents = <$in>;

    close($in);

    return $contents;
}

my $file_contents = _utf8_slurp($my_filepath);
EOF
                },
                {
                    id        => "cmd_line",
                    label     => "Command Line",
                    no_syntax => 1,
                    code      => <<'EOF',
$ perl -i.bak -ln -0777 -C -ln -e 'Something with $_ here' "$my_utf8_filepath"
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Appending to a File",
            id_base  => "append_to_file",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

my $string_to_append = "My new line\n";

$string_to_append >> io->file($my_file_path);
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;

my $string_to_append = "My new line\n";

{
    open my $out, '>>', $my_file_path;
    print {$out} $string_to_append;
    close($out);
}
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Line count",
            id_base  => "line_count",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

sub count_lines
{
    my ($filename) = @_;

    my $fh = io->file($filename);

    my $count = 0;

    while (my $l = <$fh>)
    {
        $count++;
    }

    return $count;
}
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use autodie;

sub count_lines
{
    my ($filename) = @_;

    open my $fh, '<', $filename;

    my $count = 0;
    while (my $l = <$fh>)
    {
        $count++;
    }

    close($fh);

    return $count;
}
EOF
                },
                {
                    id        => "cmd_line",
                    label     => "Command Line",
                    no_syntax => 1,
                    code      => <<'EOF',
$ perl -lnE 'END{say "$ARGV has $. lines";}' /path/to/myfile.txt
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Deleting a directory tree",
            id_base  => "delete_directory_tree",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

io("./path-to-subdir")->rmtree();
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
use File::Path qw(rmtree);

rmtree(["./path-to-subdir"], 1, 1);
EOF
                },
            ],
        }
    );

    print $ex_gen->html_with_title(
        {
            title    => "Prepending to a File (While Slurping)",
            id_base  => "prepend_to_file_while_slurping",
            examples => [
                {
                    id    => "io_all",
                    label => "IO-All",
                    code  => <<'EOF',
use IO::All;

my $filename = 'foo.txt';
my $text_to_prepend = "[Text to Prepend]\n";

my $fh = io->file($filename);

$fh->print( $text_to_prepend . $fh->all() );
EOF

                },
                {
                    id    => "core",
                    label => "Core Perl",
                    code  => <<'EOF',
my $filename = 'foo.txt';
my $text_to_prepend = "[Text to Prepend]\n";

open my $in_fh, '<', $filename
    or die "Could not open file '$filename' for reading! - $!";
my $contents = do { local $/; <$in_fh>;};
close($in_fh);

open my $out_fh, '>', $filename
    or die "Could not open file '$filename' for writing! - $!";
print {$out_fh} $text_to_prepend . $contents;
close($out_fh);
EOF
                },
            ],
        }
    );
}

1;
