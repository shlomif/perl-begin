#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $string = "۲۳۴";

if ( $string =~ /\A \d + \z/x )
{
    print "The string '$string' consists entirely of digits!\n";
}
else
{
    print "The string '$string' is not all digits!\n";
}
