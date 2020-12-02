package PerlBegin::TopicsExamples::FilesAndDirs;

use PerlBegin::TopicsExamples ();

use Path::Tiny qw/ path tempdir tempfile cwd /;

use strict;
use warnings;
use YAML::XS qw/ LoadFile /;

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
        LoadFile( path(__FILE__)->parent(1)->child('FilesAndDirs.data.yml') );

    my $text = '';
    foreach my $d (@$data)
    {
        $text .= $ex_gen->html_with_title( $d, );
    }
    return $text;
}

1;
