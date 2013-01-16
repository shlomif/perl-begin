#!/bin/bash
find dest -name '*.html' -or -name '*.xhtml' |
    ( LC_ALL=C sort  ) |
    grep -vP '^dest/tutorials/modern-perl/' |
    grep -vP '^dest/tutorials/hyperpolyglot/' |
    grep -vP '^dest/tutorials/impatient-perl/iperl\.html' |
    grep -vP '^dest/topics/cpan/life-with-cpan/' |
    grep -vP '^dest/humour/' |
    grep -vP '^dest/FAQs/freenode-perl/' |
    xargs perl bin/html-check-spelling-xmlp.pl |
    grep ':'
    # perl -lne 'print if /MathVentures\/3d.*\.xhtml/' |
exit 0
