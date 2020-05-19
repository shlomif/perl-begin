#!/usr/bin/env perl

use strict;
use warnings;
use autodie;

use Path::Tiny qw/ path /;

# use XML::LibXML;
# use XML::LibXML::XPathContext;
use Getopt::Long qw/ GetOptions /;
use HTML::Entities qw/ decode_entities /;
use Text::VimColor;

my $out_fn;

GetOptions( "output|o=s" => \$out_fn, );

# Input the filename
my $filename = shift(@ARGV)
    or die "Give me a filename as a command argument: myscript FILENAME";

my $s = path($filename)->slurp_utf8;

$s =~ s{\A.*?<body[^>]*>}{}sm;
$s =~ s{</body>.*\z}{}ms;

# It's a kludge
$s =~ s{ lang="en"}{}g;
$s =~ s{ xml:lang="en"}{}g;
$s =~ s{ type="(?:1|disc)"}{}g;
$s =~ s{<hr[^/]*/>}{<hr />}g;
$s =~ s{ target="_top"}{}g;

# Fixed in Perl 6...
$s =~ s{<(/?)h(\d)}{"<".$1."h".($2+2)}ge;

$s =~ s/[ \t]+$//gms;

sub _syntax_highlight_code
{
    my ($code) = @_;

    $code = decode_entities($code);

    my $tvc = Text::VimColor->new(
        string   => \$code,
        filetype => "perl",
    );

    my $CANARY = "glamoutttttttttTTTTTTTTTTTTTTTTTTtTTTTTTTTTT";
    return scalar( $tvc->html() =~ s{(class=")syn}{$1}gr );
}

my $CLASS1 = 'perl';
my $CLASS2 = 'programlisting';

$s =~
    s%<pre class="(?:(?:$CLASS1\s+$CLASS2)|(?:$CLASS2\s+$CLASS1))">(.*?)</pre>%
    my $code = $1;
    qq#<pre class="code $CLASS1 $CLASS2"># . _syntax_highlight_code($code) . qq#</pre>#
%egms;
path($out_fn)->spew_utf8($s);
