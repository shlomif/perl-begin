#!/usr/bin/perl

use strict;
use warnings;


package MyTidy;

use MooX qw/ late /;

extends ('Test::HTML::Tidy::Recursive');

sub calc_tidy
{
    my $self = shift;

    my $tidy = HTML::Tidy->new({ output_xhtml => 1, });
    # $tidy->ignore( type => TIDY_WARNING, type => TIDY_INFO );

    return $tidy;
}

package main;

MyTidy->new({
        targets => ['./dest'],
    })->run;
