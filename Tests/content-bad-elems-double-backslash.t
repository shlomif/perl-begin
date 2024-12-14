#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;

use XML::LibXML ();

my $parser = XML::LibXML->new();

$parser->load_ext_dtd(1);

my $doc = $parser->parse_file('./dest/tutorials/bad-elements/index.html');

my $xpc = XML::LibXML::XPathContext->new();
$xpc->registerNs( 'x', q{http://www.w3.org/1999/xhtml} );

# TEST
my $r = $xpc->find( qq{//x:code[contains(text(), "\\\\1")]}, $doc );
is( $r->size(), 0, "No double backslash", );

# TEST
$r = $xpc->find( qq{//x:code[text() = "\\1"]}, $doc );
ok( ( $r->size() >= 1 ), "right code elem", );

$r = $xpc->find( qq{//x:a}, $doc );
foreach my $el ( $r->get_nodelist )
{
    die if $el->getAttribute("href") =~ m#\A[\./]*//#ms;
}

# TEST
pass("list end");
