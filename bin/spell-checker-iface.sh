#!/bin/bash
find dest -name '*.html' -or -name '*.xhtml' |
    ( LC_ALL=C sort  ) |
    xargs perl bin/html-check-spelling-xmlp.pl |
    grep ':'
    # perl -lne 'print if /MathVentures\/3d.*\.xhtml/' |
exit 0
