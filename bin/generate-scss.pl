#! /usr/bin/env perl
#
# Short description for generate-scss.pl
#
# Version 0.0.1
# Copyright (C) 2022 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use Carp                                   qw/ confess /;
use Getopt::Long                           qw/ GetOptions /;
use Path::Tiny                             qw/ cwd path tempdir tempfile /;
use Docker::CLI::Wrapper::Container v0.0.4 ();

sub run
{
    my $size = 100;
    foreach my $h ( reverse 1 .. 6 )
    {
        printf "    h%d {\n       font-size: %d%%;\n    }\n", $h,
            ( $size += 10 );
    }
    exit(0);
}

run();

1;

__END__

=encoding UTF-8

=cut
