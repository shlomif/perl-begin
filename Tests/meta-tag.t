#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 1;

use IO::All;

{
    # TEST
    like(
        io->file("./dest/index.html")->utf8->all,
        qr#<meta(?: charset="utf-8")\s*/>#
    );
}
