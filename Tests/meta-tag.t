#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 1;

use Path::Tiny qw/ path /;

{
    # TEST
    like(
        path("./dest/index.html")->slurp_utf8(),
        qr#<meta(?: charset="utf-8")\s*/>#,
        "Has meta tag",
    );
}
