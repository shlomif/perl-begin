#!/bin/bash

for I in 1 2 3 4 ; do 
    (
        cd lect"$I"* &&
            cp -af ~/Docs/lecture/Perl/Newbies/lecture"$I"/all-in-one/* . 
    )
done
