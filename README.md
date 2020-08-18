# About this repository

These are the sources of [The Perl Beginners’ Site](http://perl-begin.org/) ,
which require [Template Toolkit](http://template-toolkit.org/)
and other dependencies to be built.

[![Travis-CI Build Status](https://travis-ci.org/shlomif/perl-begin.svg?branch=master)](https://travis-ci.org/shlomif/perl-begin)

[Travis-CI Build Status](https://travis-ci.org/shlomif/perl-begin)

## Finding the Dependencies

The dependencies are listed in the file `src/source/index.html.tt2` .

Before running GNU make for the first time, one has to run
`bash -x bin/install-npm-deps.sh` and `./gen-helpers`.
This script generates the list of directories and pages inside `lib/make/include.mak`
and `lib/make/rules.mak`.

This script also has to be invoked whenever new pages are added, or existing
ones are removed or renamed.

Enjoy!

— [Shlomi Fish](http://www.shlomifish.org/) (E-mail: shlomif@cpan.org ).
