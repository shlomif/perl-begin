#!/usr/bin/env perl

use strict;
use warnings;

s#<(cpan_self_dist|cpan_self_mod|pdoc_f) ([^>]+)/>#
    my ($tag, $args) = ($1, $2);
    "[% $tag( " . ($args =~ s{([a-z]+)="([^"]+)"}{"$1" => "$2",}gr) . ") %]"
    #eg;

s#<pdoc_f f="(\w+)">#[%- WRAPPER pdoc_f f = "$1" -%]#g;
s#</pdoc_f>#[%- END -%]#g;
s/\$\(ROOT\)\//[% base_path %]/g;
