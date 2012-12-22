# About this repository

These are the sources of [The Perl Beginners’ Site](http://perl-begin.org/) ,
which requires [Website Meta Language](http://bitbucket.org/shlomif/website-meta-language), [Latemp](http://bitbucket.org/shlomif/latemp) and other
dependencies to be built (so they may not be for the uninitiated).

## Finding the Dependencies

The dependencies are listed in the file `src/source/index.html.wml` .

Before running make for the first time, one has to run `./gen-helpers.pl`.
This script generates the list of directories and pages inside `include.mak`
and `rules.mak`.

This script also has to be invoked whenever new pages are added, or existing
ones are removed or renamed.

Enjoy!

— [Shlomi Fish](http://www.shlomifish.org/) (E-mail: shlomif@cpan.org ).
