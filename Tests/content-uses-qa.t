#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;

use XML::LibXML ();

my $parser = XML::LibXML->new();

$parser->load_ext_dtd(1);

my $doc = $parser->parse_file('./dest/uses/qa/index.html');

my $xpc = XML::LibXML::XPathContext->new();
$xpc->registerNs( 'x', q{http://www.w3.org/1999/xhtml} );

# TEST
{
    my $r =
        $xpc->find( q{//*[contains(text(), "other good practises.")]}, $doc );
    is( $r->size(), 0, "No typo", );
}

# TEST
{
    my $r =
        $xpc->find( q{//*[contains(text(), "other good practices.")]}, $doc );
    cmp_ok( $r->size(), '>=', 1, "Found nontypo", );
}
