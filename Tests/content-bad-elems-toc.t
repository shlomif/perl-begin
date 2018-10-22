#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 1;

use XML::LibXML ();

my $parser = XML::LibXML->new();

$parser->load_ext_dtd(1);

my $doc = $parser->parse_file('./dest/tutorials/bad-elements/index.html');

my $xpc = XML::LibXML::XPathContext->new();
$xpc->registerNs( 'x', q{http://www.w3.org/1999/xhtml} );

# TEST
my $r = $xpc->find(
q{//x:div[@class="toc"]/x:ul[@class="toc"]/x:li/x:ul/x:li/x:span/x:a[contains(text(), "Correct style for using")]},
    $doc
);
is( $r->size(), 1, "Found one toc item", );
