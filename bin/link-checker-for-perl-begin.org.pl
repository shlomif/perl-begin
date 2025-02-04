use strict;
use warnings;

#base='http://localhost/shlomif/homepage-local/'
#base='http://localhost:2400/sites/hp/'
my $base = 'http://localhost:2400/sites/pb/';
my $ocs  = "--only-check-site-flow";
my @args;
push @args, $ocs if ( @ARGV and $ARGV[0] eq $ocs );
exec(
    $^X,  "-I", "lib", "-MWWW::LinkChecker::Internal::App",
    "-e", 'WWW::LinkChecker::Internal::App->run()',
    "--", "check", "--base=${base}", @args
);

__END__

    \
    --before-insert-skip='//.+?//' \
    --before-insert-skip='/Files/files/video/[^/]+\.webm\z' \
    --before-insert-skip='/\.htaccess\z' \
    --before-insert-skip='/art/by-others/(?:BertycoX/BertycoX-dirs|Yachar/Yachar-dirs)/\z' \
    --before-insert-skip='/humour/fortunes/(?:bbt|friends|joel-on-software|nyh-sigs|osp_rules|paul-graham|sharp-perl|sharp-programming|shlomif|shlomif-factoids|shlomif-fav|subversion|tinic)\z' \
    --before-insert-skip='/humour/fortunes/fortunes_show\.(?:cgi|py)\z' \
    --before-insert-skip='/humour/fortunes/show-cgi\.txt\z' \
    --before-insert-skip='/humour/fortunes/show\.cgi' \
    --before-insert-skip='/js/MathJax/' \
    --before-insert-skip='/lecture/WebMetaLecture/.*\.(?:wml|css)\z' \
    --before-insert-skip='/lecture/WebMetaLecture/all-in' \
    --before-insert-skip='/lecture/WebMetaLecture/slides--all-in' \
    --before-insert-skip='/lecture/WebMetaLecture/slides/examples/frames/' \
    --before-insert-skip='/lm-solve/\z' \
    --before-insert-skip='/me/blogs/agg/[\w\-]*\.xml\z' \
    --before-insert-skip='/open-source/projects/conf/vim/current/\z' \
    --before-insert-skip='/open-source/projects/yjobs' \
    --before-insert-skip='/philosophy/solving/' \
    --before-insert-skip='\.(?:diff|epub|js|pl|raw\.html|rtf|tar\.xz|txt|zip|xsl|xslt)\z' \
    ;
