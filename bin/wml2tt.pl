#!/usr/bin/env perl

use strict;
use warnings;

s#<(cpan_self_dist) ([^>]+)/>#
    my ($tag, $args) = ($1, $2);
    "[% $tag( " . ($args =~ s{([a-z]+)="([^"]+)"}{"$1" => "$2",}gr) . ") %]"
    #eg;
