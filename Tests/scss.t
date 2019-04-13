#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

# TEST
is(
    system(
        qw%prettier --parser scss --arrow-parens always --tab-width 4 --trailing-comma all -c%,
        glob("lib/sass/*.scss")
    ),
    0,
    "scss are formatted fine",
);
