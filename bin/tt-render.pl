#!/usr/bin/env perl

use strict;
use warnings;
use 5.014;
use utf8;

use lib './lib';
use URI::Escape qw( uri_escape );
use Template ();

use Path::Tiny qw/ path /;

use HTML::Widgets::NavMenu::HeaderRole ();
use HTML::Widgets::NavMenu::EscapeHtml qw( escape_html );
use HTML::Latemp::AddToc   ();
use Module::Format::AsHTML ();
use MyNavData              ();

my $cpan = Module::Format::AsHTML->new;

sub _render_leading_path_component
{
    my $component  = shift;
    my $title      = $component->title;
    my $title_attr = defined($title) ? qq# title="$title"# : "";
    return
          "<a href=\""
        . escape_html( $component->direct_url )
        . "\"$title_attr>"
        . $component->label() . "</a>";
}

my $LATEMP_SERVER = "perl_begin";
my $template      = Template->new(
    {
        INCLUDE_PATH => [ ".", "./lib", ],
        POST_CHOMP   => 1,
        RELATIVE     => 1,
        ENCODING     => 'utf8',
    }
);

sub cpan_mod
{
    my $args = shift;
    return
        qq#<a href="http://metacpan.org/module/$args->{m}">$args->{body}</a>#;
}

sub cpan_dist
{
    my $args = shift();
    return
        qq#<a href="http://metacpan.org/release/$args->{d}">$args->{body}</a>#;
}

sub slurp
{
    return path(shift)->slurp_utf8;
}

sub retrieved_slurp
{
    return slurp( "lib/retrieved-html-parts/" . shift );
}

my $NAME = qr/Perl[\- ]Begin/;
my $H    = "The Perl Beginners’ Site";

sub _process_title
{
    my $args  = shift;
    my $title = $args->{title};
    return (
        ( $title =~ $NAME )
        ? $title
        : ("$title - $H")
    );
}

my @DEST = ( ".", "dest", );
my $vars = +{
    process_title => \&_process_title,
    wiki_link     => sub {
        my $args = shift;
        return qq#http://perl.net.au/wiki/Beginners#
            . ( $args->{url} ? '/' . $args->{url} : '' );
    },
    cpan        => $cpan,
    cpan_mod    => \&cpan_mod,
    irc_channel => sub {
        my $args    = shift;
        my $net     = $args->{net};
        my $chan    = $args->{chan};
        my %servers = (
            'freenode' => "irc.freenode.net",
            'efnet'    => "irc.Prison.NET",
            'oftc'     => "irc.oftc.net",
            'undernet' => "us.undernet.org",
            'ircnet'   => "ircnet.demon.co.uk",
        );
        if ( !exists( $servers{$net} ) )
        {
            die "Unknown network!";
        }
        return
            qq|<a href="irc://$servers{$net}/%23$chan"><code>#$chan</code></a>|;
    },
    retrieved_slurp => \&retrieved_slurp,
    p4n_slurp       => sub {
        my $idx = shift;
        return path(
            "lib/tutorials/perl-for-newbies/lect$idx-all-in-one/index.html")
            ->slurp_utf8() =~ s{.*<body[^>]*>}{}mrs =~ s{< / body >.*}{}mrsx;
    },
    book_info => sub {
        require PerlBegin::Books;
        return PerlBegin::Books->book_info(shift);
    },
    files_and_dirs => sub {
        require PerlBegin::TopicsExamples::FilesAndDirs;

        return PerlBegin::TopicsExamples::FilesAndDirs->_run();
    }
};

my @tt = path("lib/make/tt2.txt")->lines_raw;
chomp @tt;
my $toc   = HTML::Latemp::AddToc->new;
my %INDEX = ( map { $_ => 1 } 'index.html', 'index.xhtml' );

foreach my $input_tt2_page_path (@tt)
{
    my @fn     = split m#/#, $input_tt2_page_path;
    my @fn_nav = @fn;
    my $tail   = \( $fn_nav[-1] );
    $$tail = '' if exists $INDEX{$$tail};
    my $base_path = ( '../' x $#fn );
    my $nav_bar   = HTML::Widgets::NavMenu::HeaderRole->new(
        'path_info'    => ( join( '/', @fn_nav ) || '/' ),
        'current_host' => $LATEMP_SERVER,
        MyNavData::get_params(),
        'ul_classes'     => [],
        'no_leading_dot' => 1,
    );

    my $rendered_results = $nav_bar->render();

    my $nav_links_obj = $rendered_results->{nav_links_obj};

    my $nav_html = $rendered_results->{html};

=begin removed
            my $nav_links = $rendered_results->{nav_links};
            my $nav_links_renderer = MyNavLinks->new(
                'nav_links'     => $nav_links,
                'nav_links_obj' => $nav_links_obj,
                'root'          => $base_path,
            );
            my $with_accesskey = '';
            my @params;
            if ( $with_accesskey ne "" )
            {
                push @params, ( 'with_accesskey' => $with_accesskey );
            }
            my $text = $nav_links_renderer->get_total_html(@params);
=cut

    my $nav_links_html = '';

LINKS:
    foreach my $key ( sort { $a cmp $b } keys(%$nav_links_obj) )
    {
        if ( ( $key eq 'top' ) or ( $key eq 'up' ) )
        {
            next LINKS;
        }
        my $val        = $nav_links_obj->{$key};
        my $url        = escape_html( $val->direct_url() );
        my $title      = $val->title();
        my $title_attr = defined($title) ? " title=\"$title\"" : "";
        $nav_links_html .= "<link rel=\"$key\" href=\"$url\"$title_attr />\n";
    }

    my $leading_path = $rendered_results->{leading_path};

    my $leading_path_string = join( " → ",
        ( map { _render_leading_path_component($_) } @$leading_path ) );

    $vars->{base_path}           = $base_path;
    $vars->{leading_path_string} = $leading_path_string;
    $vars->{nav_links}           = $nav_links_html;
    $vars->{nav_menu_html}       = join( '', @$nav_html );
    $vars->{share_link}          = escape_html(
        uri_escape(
            MyNavData::get_hosts()->{ $nav_bar->current_host() }->{'base_url'}
                . $nav_bar->path_info()
        )
    );
    $vars->{slurp_bad_elems} = sub {
        return path("lib/docbook/5/rendered/bad-elements.xhtml")->slurp_utf8()
            =~ s{\$\(ROOT\)}{$base_path}gr;
    };
    my $html = '';
    $template->process( "src/$input_tt2_page_path.tt2",
        $vars, \$html, binmode => ':utf8', )
        or die $template->error();

    $toc->add_toc( \$html );
    path( @DEST, @fn, )->spew_utf8($html);
}
