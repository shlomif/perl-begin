package PerlBegin::TopicsExamples::FilesAndDirs;

use PerlBegin::TopicsExamples;

use strict;
use warnings;
use YAML::XS qw/ DumpFile LoadFile /;

sub _run
{
    my ($class) = @_;

    # Examples generator:
    my $ex_gen = PerlBegin::TopicsExamples->new(
        {
            default_syntax => 'perl',
        }
    );

    my ($data) =
        LoadFile('../lib/PerlBegin/TopicsExamples/FilesAndDirs.data.yml');

    foreach my $d (@$data)
    {
        print $ex_gen->html_with_title( $d, );
    }
}

1;
