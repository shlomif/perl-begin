package Shlomif::Spelling::FindFiles;

use strict;
use warnings;

use MooX qw/late/;
use List::MoreUtils qw/any/;

use HTML::Spelling::Site::Finder;

my @prunes =
(
    qr#\Adest/tutorials/modern-perl/#,
    qr#\Adest/tutorials/hyperpolyglot/#,
    qr#\Adest/tutorials/impatient-perl/iperl\.html#,
    qr#\Adest/topics/cpan/life-with-cpan/#,
    qr#\Adest/humour/#,
    qr#\Adest/FAQs/freenode-perl/#,
    qr#\Adest/uses/text-parsing/htmlparsing.icenina.ca/#,
);

sub list_htmls
{
    my ($self) = @_;

    return HTML::Spelling::Site::Finder->new(
        {
            root_dir => 'dest',
            prune_cb => sub {
                my ($path) = @_;
                return any { $path =~ $_ } @prunes;
            },
        }
    )->list_all_htmls;
}

1;

