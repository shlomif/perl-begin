#!/bin/bash

for part_idx in 1 2 3 4 5
do
    (
        echo "Processing Part #$part_idx"
        cd lect"$part_idx"-all-in-one
        lect_source="$HOME/Docs/homepage/homepage/trunk/lib/presentations/qp/perl-for-newbies/$part_idx/"
        if false
        then
            (cd $lect_source && \
                quadp render_all_in_one_page --output-dir all-in-one
            )
        fi
        cp -af "$lect_source"/all-in-one/* .
    )
done
