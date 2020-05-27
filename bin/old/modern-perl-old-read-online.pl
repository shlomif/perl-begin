#! /usr/bin/env perl
#
# Short description for modern-perl-old-read-online.pl
#
# Author Shlomi Fish <shlomif@cpan.org>
# Version 0.0.1
# Copyright (C) 2020 Shlomi Fish <shlomif@cpan.org>
#
use strict;
use warnings;
use 5.014;
use autodie;

use Path::Tiny qw/ path tempdir tempfile cwd /;

print qq#<h2 id="chapters">Chapters</h2>\n#;

print "<ul>\n";
use XML::LibXML ();
use CGI         ();

foreach my $idx ( 0 .. 12 )
{
    my $chapter_frag     = sprintf( "chapter_%02d", $idx );
    my $chapter_xhtml_fn = "xhtml/$chapter_frag.html";

    my $dom = XML::LibXML->load_html(
        location => "./tutorials/modern-perl/$chapter_xhtml_fn", );
    my $title = $dom->findnodes('//h2')->[0]->textContent();

    printf
qq{<li><b>Chapter %d</b> (<a href="%s">HTML</a> , <a href="pdf/%s.pdf">PDF</a>) - %s.</li>\n},
        ( $idx, $chapter_xhtml_fn, $chapter_frag, CGI::escapeHTML($title) );
}
print "</ul>\n";
