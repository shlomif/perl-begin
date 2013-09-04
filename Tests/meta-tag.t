#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use IO::All;

{
    # TEST
    like(
        io->file("./dest/index.html")->utf8->all,
        qr#<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />#
    );
}
