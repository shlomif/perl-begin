#!/usr/bin/env perl

use strict;
use warnings;

use IO::All qw/ io /;

if (system("make", "--silent", "-f", "lib/make/build-deps/build-deps.mak"))
{
    die "build-deps failed!";
}

require HTML::Latemp::GenMakeHelpers;
require File::Find::Object::Rule;

if (-f "rules.mak")
{
    system("make", "-s", "src/style.css");
}
else
{
    system("compass", "compile");
}

my $generator =
    HTML::Latemp::GenMakeHelpers->new(
        'hosts' =>
        [
            {
                'id' => "common",
                'source_dir' => "common",
                'dest_dir' => "\$(TARGET)",
            },
            {
                'id' => "perl_begin",
                'source_dir' => "src",
                'dest_dir' => "\$(TARGET)",
            },
        ],
    );

$generator->process_all();

my $text = io("rules.mak")->slurp();
$text =~ s#^(\$\(PERL_BEGIN_DOCS_DEST\)[^\n]+\n\t)[^\n]+#${1}\$(call PERL_BEGIN_INCLUDE_WML_RENDER)#ms or die "Cannot subt";
$text =~ s#^(\$\(PERL_BEGIN_COMMON_DOCS_DEST\)[^\n]+\n\t)[^\n]+#${1}\$(call PERL_BEGIN_COMMON_INCLUDE_WML_RENDER)#ms or die "Cannot subt";

{
    my $needle = 'cp -f $< $@';
    $text =~ s#^\t\Q$needle\E$#\t\$(call COPY)#gms;
}

io("rules.mak")->print($text);

{
    open my $out_fh, ">", "p4n.mak";

    my @targets;
    foreach my $part_idx (1 .. 5)
    {
         # find all the .pm files in @INC
         my @files =
            File::Find::Object::Rule
                ->any(
                    (File::Find::Object::Rule
                        ->name(qr/\.svn/)
                        ->prune()
                        ->discard()
                    ),
                    (File::Find::Object::Rule
                        ->file()
                        ->exec(sub {
                                $_[0] ne "index\.html"
                        })
                    ),
                )->in("lib/tutorials/perl-for-newbies/lect${part_idx}-all-in-one/")
                ;

        foreach my $f (@files)
        {
            my $target = $f;

            # print $f, "\n";
            $target =~ s{\Alib/}{};

            $target =~ s{/lect(\d+)-all-in-one/}{/part$1/};

            $target = "\$(PERL_BEGIN_DEST)/$target";

            push @targets, $target;

            print {$out_fh} "$target: $f\n\tmkdir -p `dirname \$\@`\n\tcp -f \$< \$\@\n\n";
        }
    }

    my $makefile_var_name = "DEST_TUTORIALS_PERL_FOR_NEWBIES_TARGETS";

    print {$out_fh} "$makefile_var_name = " . join(" ", @targets) . "\n\n";

    print {$out_fh} "perl_for_newbies_extra_data: \$($makefile_var_name)\n\n";

    close($out_fh);
}

{
    open my $out_fh, ">", "Makefile" or die "Cannot open Makefile $!";
    print {$out_fh} "include lib/make/_Main.mak\n";
    close ($out_fh);
}

1;

