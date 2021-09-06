#! /usr/bin/env perl
#
# Short description for split-demo.pl
#

use strict;
use warnings;
use 5.014;
use autodie;

use Data::Dumper qw / Dumper /;

my $string = '/why/hello/there///';

say Dumper( [ split m#/#, $string ] );
say Dumper( [ split m#/#, $string, -1 ] );
