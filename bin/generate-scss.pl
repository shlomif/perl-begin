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

use Carp qw/ confess /;

sub run
{
    my $size = 100;
    my $ret  = "";
    foreach my $h ( reverse 1 .. 6 )
    {
        $ret .= sprintf( "    h%d {\n       font-size: %d%%;\n    }\n",
            $h, ( $size += 10 ) );
    }
    primtf( "%s", $ret );
    exit(0);
}

run();

1;

__END__

=encoding UTF-8

=cut
