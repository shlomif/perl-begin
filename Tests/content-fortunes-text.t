#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;
use Path::Tiny qw/ path /;
use lib './lib';

my $SRC_POST_DEST = "dest";

{
    # TEST
    ok(
        scalar(
            (
                -s "$SRC_POST_DEST/css/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png"

            ) > 20
        ),
        "png exists",
    );
}

__END__

=head1 COPYRIGHT & LICENSE

Copyright 2018 by Shlomi Fish

This program is distributed under the MIT / Expat License:
L<http://www.opensource.org/licenses/mit-license.php>

=cut
