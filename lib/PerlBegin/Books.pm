package PerlBegin::Books;

use strict;
use warnings;

sub get_ext_publisher
{
    my ( $self, $p ) = @_;

    return {
        "oreilly" =>
            qq{<a href="http://www.oreilly.com/">O'Reilly and Associates</a>},
        "manning" =>
            qq{<a href="http://www.manning.com/">Manning Publications Co.</a>},
        "new-riders" => qq{<a href="http://www.newrider.com/">New Riders</a>},
        "wrox"       => qq{<a href="http://www.wrox.com/">Wrox Press Inc.</a>},
        "apress"     => qq{<a href="http://www.apress.com/">Apress</a>},
        "morgan_kaufmann" =>
qq{<a href="http://en.wikipedia.org/wiki/Morgan_Kaufmann_Publishers">Morgan Kaufmann Publishers</a>},
        "onyx" => qq{<a href="http://www.onyxneon.com/">Onyx Neon Press</a>},
    }->{$p} // do { die "Foo <$p>"; };
}

sub book_store_amazon
{
    my ( $self, $args ) = @_;

    return
qq%<a href="http://www.amazon.com/exec/obidos/ASIN/$args->{isbn}/ref=nosim/shlomifishhom-20/">$args->{title}</a>%;
}

sub book_store
{
    my ( $self, $args ) = @_;

    my $ucstore =
          "$args->{store}" eq "ukamazon"
        ? "Amazon UK"
        : ucfirst("$args->{store}");
    return "$args->{store}" eq "amazon"
        ? $self->book_store_amazon($args)
        : qq#<a href="http://learn.perl.org/redirect?url=book;bookstore=$args->{store};bookisbn=$args->{isbn}">$args->{title}</a>#;
}

sub book_info
{
    my ( $self, $args ) = @_;

    return;
}

1;
