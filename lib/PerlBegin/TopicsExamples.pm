package PerlBegin::TopicsExamples;

use strict;
use warnings;

use MooX 'late';

use CGI ();
use Text::VimColor;

use Carp ();

has default_syntax => (is => 'ro', isa => 'Str');
has main_pre_css_classes => (is => 'ro', isa => 'ArrayRef[Str]',
    default => sub {
        return [qw(code)];
    },
);

sub _calc_post_code
{
    my $self = shift;
    my $ex_spec = shift;

    my $pre_code = $ex_spec->{code};

    if ($ex_spec->{no_syntax})
    {
        return "<pre>\n" . CGI::escapeHTML($pre_code) . "</pre>\n";
    }
    else
    {
        my $syntax = ($ex_spec->{syntax} || $self->default_syntax);

        my $code = <<"EOF";
#!/usr/bin/perl

use strict;
use warnings;

$pre_code
EOF

        my $tvc = Text::VimColor->new(
            string => \$code,
            filetype => $syntax,
        );

        return
            qq|<pre class="|
                . join(' ', map { CGI::escapeHTML($_) }
                    @{$self->main_pre_css_classes}, $syntax
                )
            . qq|">\n|
            . ($tvc->html() =~ s{(class=")syn}{$1}gr)
            . qq|\n</pre>\n|
            ;

    }
}

sub render
{
    my ($self, $args) = @_;

    my $examples = $args->{'examples'};
    my $title = $args->{'title'};
    my $id_base = $args->{'id_base'};

    my $ret_string = '';

    my @lis;
    my @codes;

    foreach my $ex_spec (@$examples)
    {
        my $id = $id_base . '__' . $ex_spec->{id};
        my $label = $ex_spec->{label};

        my $esc_id = CGI::escapeHTML($id);
        my $esc_label = CGI::escapeHTML($label);

        my $post_code = $self->_calc_post_code($ex_spec);

        push @lis, qq[<li><a href="#$esc_id">$esc_label</a></li>\n];
        push @codes, qq[<div id="$esc_id">$post_code</div>];
    }

    return
        qq{<div class="tabs">\n}
            . qq{<ul>\n}
                . join("\n", @lis)
            . qq{\n</ul>\n}
            . join("\n", @codes) .
        qq{</div>\n}
        ;
}

sub html_with_title
{
    my ($self, $args) = @_;

    my $id_base = $args->{'id_base'}
        or Carp::confess("id_base not specified.");
    my $title = $args->{'title'}
        or Carp::confess("title not specified.");

    return
        qq[<h3 id="] . CGI::escapeHTML($id_base)
        . qq[">] . CGI::escapeHTML($title) . qq[</h3>\n\n]
        . $self->render($args)
        ;
}

1;
