#!/usr/bin/perl

use strict;
use warnings;

use IO::All qw/ io /;

my ($fn) = @ARGV;

sub _f
{
    return io->file($fn)->utf8;
}

my $text = _f()->all;

# In case there's an error - fail and need to rebuild.
_f()->unlink();

$text =~ s#^\({5}include "([^"]+)"\){5}\n#io->file("lib/$1")->utf8->all#egms;
$text =~
s#\({5}chomp_inc='([^']+)'\){5}#io->file("lib/$1")->chomp->utf8->getline("\n")#egms;

if ( $ENV{F} )
{
    foreach my $class (qw(info irc-conversation))
    {
        my $table_from = qq{<table class="$class">};
        my $table_to   = qq{<table class="$class" summary="">};

        $text =~ s#\Q$table_from\E#$table_to#g;
    }
}

$text =~ s#(</div>|</li>|</html>)\n\n#$1\n#g;

# Remove surrounding space of tags.
$text =~ s#\s*(</?(?:body|(?:br /)|div|head|li|ol|p|title|ul)>)\s*#$1#gms;

$text =~ s#\s+xml:space="[^"]*"##g;

# Remove document trailing space.
$text =~ s#\s+\z##ms;

my $XMLNS_NEEDLE = <<'EOF';
 xmlns:db="http://docbook.org/ns/docbook" xmlns:d="http://docbook.org/ns/docbook" xmlns:vrd="http://www.shlomifish.org/open-source/projects/XML-Grammar/Vered/" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xhtml="http://www.w3.org/1999/xhtml"
EOF

my @needles = $XMLNS_NEEDLE =~ m#\b(xmlns:[a-zA-Z_]+="[^"]+")#g;

my $ALTERNATIVES_TEXT = join '|',
    map { '(?:' . ( quotemeta $_ ) . ')' } @needles;

$text =~ s#(<div)(?:\s+(?:$ALTERNATIVES_TEXT))+#$1 #gms;

_f()->print($text);
