#!/usr/bin/perl

use strict;
use warnings;

use Test::HTML::Tidy::Recursive::Strict;

Test::HTML::Tidy::Recursive::Strict->new(
    {
        targets => ['./dest'],
    }
)->run;
