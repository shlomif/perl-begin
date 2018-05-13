#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use IO::All;

{
    my $RE1 = qr#\s+content="text/html;\s*charset=utf-8"#;
    my $RE2 = qr#\s+http-equiv="Content-Type"#;

    # TEST
    like(
        io->file("./dest/index.html")->utf8->all,
        qr#<meta(?:(?:$RE1$RE2)|(?:$RE2$RE1))\s*/>#
    );
}
