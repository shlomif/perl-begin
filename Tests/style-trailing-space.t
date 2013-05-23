#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

{
    open my $ack_fh, '-|', 'ack', '-l', q/[ \t]+$/,
        '.', glob('lib/sass/*.sass')
        or die "Cannot open ack for input - $!";

    my $count_lines = 0;
    ACK_OUTPUT:
    while (my $l = <$ack_fh>)
    {
        chomp($l);

        if (
            ($l =~ m{\Alib/tutorials/modern-perl/pdf/[^\.]+\.pdf\z})
                or
            ($l =~ m{\A\.sass-cache/})
        )
        {
            next ACK_OUTPUT;
        }
        $count_lines++;
        diag("$l\n");
    }

    # TEST
    is ($count_lines, 0, "Count lines is 0.");

    close($ack_fh);
}
