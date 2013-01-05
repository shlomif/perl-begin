package PerlBegin::TopicsExamples;

use strict;
use warnings;

use MooX 'late';

use CGI ();
use Text::VimColor;

has 'title' => (isa => 'Str', is => 'ro');
has 'id_base' => (isa => 'Str', is => 'ro');
has 'examples' => (isa => 'ArrayRef[HashRef]', is => 'ro');

sub render
{
    my $self = shift;

    my $ret_string = '';

    my @lis;
    my @codes;

    foreach my $ex_spec (@{$self->examples})
    {
        my $id = $self->id_base . '__' . $ex_spec->{id};
        my $label = $ex_spec->{label};
        my $pre_code = $ex_spec->{code};

        my $esc_id = CGI::escapeHTML($id);
        my $esc_label = CGI::escapeHTML($label);

        my $post_code;

        if ($ex_spec->{no_syntax})
        {
            $post_code = "<pre>\n" . CGI::escapeHTML($pre_code) . "</pre>\n";
        }
        else
        {
            my $code = <<"EOF";
#!/usr/bin/perl

use strict;
use warnings;

$pre_code
EOF

            my $tvc = Text::VimColor->new(
                string => \$code,
                filetype => 'perl',
            );

            $post_code =
                qq|<pre class="perl">\n|
                . ($tvc->html() =~ s{(class=")syn}{$1}gr)
                . qq|\n</pre>\n|
                ;
        }

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
    my $self = shift;

    return
        qq[<h3 id="] . CGI::escapeHTML($self->id_base())
        . qq[">] . CGI::escapeHTML($self->title()) . qq[</h3>\n\n]
        . $self->render()
        ;
}

1;
