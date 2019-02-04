#!/usr/bin/perl

use strict;
use warnings;

use utf8;

use lib './lib';
use CGI                ();
use Template           ();
use File::Find::Object ();

use File::Path qw( mkpath );
use File::Spec ();
use File::Copy qw( copy );

my $object_class  = "HTML::Widgets::NavMenu::HeaderRole";
my $LATEMP_SERVER = "perl_begin";
use HTML::Widgets::NavMenu::HeaderRole ();
use MyNavData                          ();
use MyNavLinks                         ();
my $template = Template->new(
    {
        INCLUDE_PATH => ".",
        POST_CHOMP   => 1,
        RELATIVE     => 1,
        ENCODING     => 'utf8',
    }
);

my $tree = File::Find::Object->new( {}, './src' );

while ( my $result = $tree->next_obj() )
{
    if ( $result->is_dir() )
    {
        if ( $result->path() eq './dest' )
        {
            $tree->prune();
        }
        else
        {
            mkpath(
                File::Spec->catdir(
                    File::Spec->curdir(), "dest",
                    @{ $result->full_components() }
                )
            );
        }
    }
    else
    {
        my $basename = $result->basename;
        if ( $basename =~ s/\.html\.tt2\z/.html/ )
        {
            my @fn     = ( @{ $result->dir_components() }, $basename );
            my @fn_nav = @fn;
            if ( $fn_nav[-1] =~ m#\Aindex\.x?html\z# )
            {
                $fn_nav[-1] = '';
            }
            my $base_path =
                ( '../' x scalar( @{ $result->dir_components() } ) );
            my $nav_bar = $object_class->new(
                'path_info'    => join( '/', @fn_nav ),
                'current_host' => $LATEMP_SERVER,
                MyNavData::get_params(),
                'ul_classes'     => [ "navbarmain", ("navbarnested") x 10 ],
                'no_leading_dot' => 1,
            );

            my $rendered_results = $nav_bar->render();

            my $nav_links = $rendered_results->{nav_links};

            my $nav_links_obj = $rendered_results->{nav_links_obj};

            my $nav_html = $rendered_results->{html};

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

            my $t2 = '';

            {
                my @keys = ( sort { $a cmp $b } keys(%$nav_links_obj) );
            LINKS:
                foreach my $key (@keys)
                {
                    if ( ( $key eq 'top' ) or ( $key eq 'up' ) )
                    {
                        next LINKS;
                    }
                    my $val        = $nav_links_obj->{$key};
                    my $url        = CGI::escapeHTML( $val->direct_url() );
                    my $title      = $val->title();
                    my $title_attr = defined($title) ? " title=\"$title\"" : "";
                    $t2 .= "<link rel=\"$key\" href=\"$url\"$title_attr />\n";
                }
            }

            my $leading_path = $rendered_results->{leading_path};

            my $render_leading_path_component = sub {
                my $component  = shift;
                my $title      = $component->title();
                my $title_attr = defined($title) ? " title=\"$title\"" : "";
                return
                      "<a href=\""
                    . CGI::escapeHTML( $component->direct_url() )
                    . "\"$title_attr>"
                    . $component->label() . "</a>";
            };

            my $leading_path_string = join( " → ",
                ( map { $render_leading_path_component->($_) } @$leading_path )
            );
            my $vars = +{
                base_path           => $base_path,
                leading_path_string => $leading_path_string,
                icon_en =>
qq#<img src="${base_path}icon_lang_en.png" alt="סמל אנגלית" class="symbol" /> #,
                icon_he =>
qq#<img src="${base_path}icon_lang_he.png" alt="סמל עברית" class="symbol" /> #,
                nav_links     => $t2,
                nav_menu_html => join( '', @$nav_html ),
            };

            $template->process(
                $result->path(), $vars,
                File::Spec->catfile( File::Spec->curdir(), "dest", @fn, ),
                binmode => ':utf8',
            ) or die $template->error();
        }

=begin removed

        elsif (
            $basename !~ /~\z/
            && ( !($basename =~ /\A\./ && $basename =~ /\.swp\z/) )
            && ($basename ne 'process.pl')
        )
        {
            copy($result->path,
                File::Spec->catfile(File::Spec->curdir(), "dest",
                    @{$result->dir_components()}, $basename),
            );
        }
=end removed

=cut

    }
}
