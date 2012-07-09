#!/bin/bash

for I in 1 2 3 4 ; do
    (
        echo "Processing Part #$I"
        cd lect"$I"-all-in-one
        lect_source="$HOME/Docs/homepage/homepage/trunk/lib/presentations/qp/perl-for-newbies/$I/"
        (cd $lect_source && \
            perl "$HOME"/progs/quadpres/trunk/temporary-scripts/render-all-in-one-page.pl
        )
        cp -af "$lect_source"/all-in-one/* .
    )
done
