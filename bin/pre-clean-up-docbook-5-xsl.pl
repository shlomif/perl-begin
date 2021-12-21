#! /usr/bin/env perl -lpi
#
# Copyright (C) 2020 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;

use XML::LibXML               ();
use XML::LibXML::XPathContext ();

sub _place_introduction_on_top_of_xhtml
{
    my $s   = shift;
    my $xml = XML::LibXML->load_xml( string => $s );
    my $xpc = XML::LibXML::XPathContext->new($xml);
    $xpc->registerNs( 'xhtml', 'http://www.w3.org/1999/xhtml' );
    my @intro = $xpc->findnodes(
        q#//xhtml:section[@class = 'section' and descendant::*[@id='intro']]#);
    die if @intro != 1;
    my @parent = $xpc->findnodes(q#//xhtml:section[@class='article']#);
    my @heads  = $xpc->findnodes(
q#//xhtml:div[@class='titlepage']/descendant::*[starts-with(local-name(), 'h')]#
    );
    die if @parent != 1;
    die if @intro != 1;
    die if @heads == 0;
    my $i = $intro[0];
    $i->parentNode->removeChild($i);

    my $p = $parent[0];
    $p->insertBefore( $i,        $p->firstChild );
    $p->insertBefore( $heads[0], $p->firstChild );
    my $ret = $xml->toString();
    return $ret;
}

$_ = _place_introduction_on_top_of_xhtml($_);
s/[ \t]+$//gms;
s{\Q xmlns="http://docbook.org/ns/docbook"\E}{}g;
s{(</?h)([0-9]+)}{$1.($2-1)}eg;
