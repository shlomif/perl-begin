#!/usr/bin/env perl

use 5.014;
use autodie;
use warnings;
use strict;
use diagnostics;

my @slides = qw(
    start
    whoami
    teaching-perl

    compilation-vs-runtime
    subroutines
    BEGIN-executes-during-compilation
    eval-quotes-compiles-during-runtime
    caveats

    undef-true-false
    distinguishing-undef-false
    return-values
    sql-null
    caveats

    lexicals-vs-globals
    global-variables
    globals-in-packages
    scalar-variables
    local-for-temp-global-values
    subroutines-lexicals-globals
    caveats

    scalar-vs-list
    lists-into-scalar-variables
    array-length
    scalars-into-lists
    wantarray
    print-localtime
    prototypes
    caveats

    references
    arrays-in-arrays
    arrays-in-hashes
    hashes-in-hashes
    subroutine-refs
    dereferencing
    caveats

    conclusion
);

foreach my $slide (@slides)
{
    open my $fh, ">", $slide;

    $fh->print( "

<p>$slide</p>

<%attr>
title => '$slide'
</%attr>
" );

    close $fh;
}
