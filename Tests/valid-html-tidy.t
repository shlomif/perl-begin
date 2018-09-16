#!/usr/bin/perl

use strict;
use warnings;

use Test::HTML::Tidy::Recursive::Strict;

Test::HTML::Tidy::Recursive::Strict->new(
    {
        filename_filter => sub {
            return shift !~ m{tutorials/perl-for-newbies/part[0-9]+/};
        },
        targets => ['./dest'],
    }
)->run;
