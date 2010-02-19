#!/usr/bin/perl

use strict;
use warnings;

use HTML::Latemp::GenMakeHelpers;
use File::Find::Object::Rule;

if (-f "rules.mak")
{
    system("make", "-s", "src/style.css");
}
else
{
    system("compass");
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
                'id' => "berlios",
                'source_dir' => "src",
                'dest_dir' => "\$(TARGET)",
            },
        ],
    );
    
$generator->process_all();

{
    open my $out_fh, ">", "p4n.mak";

    my @targets;
    foreach my $part_idx (1 .. 4)
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
            
            $target = "\$(BERLIOS_DEST)/$target";

            push @targets, $target;

            print {$out_fh} "$target: $f\n\tmkdir -p `dirname \$\@`\n\tcp -f \$< \$\@\n\n";
        }
    }

    my $makefile_var_name = "DEST_TUTORIALS_PERL_FOR_NEWBIES_TARGETS";

    print {$out_fh} "$makefile_var_name = " . join(" ", @targets) . "\n\n";

    print {$out_fh} "perl_for_newbies_extra_data: \$($makefile_var_name)\n\n";

    close($out_fh);
}
1;

