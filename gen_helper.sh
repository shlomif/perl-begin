#!/bin/bash
list_wmls()
{
    find ./src/ -name '*.html.wml' | 
        sed 's!^\./src/!!' | 
        sed 's!\.html\.wml$!!' | 
        grep -v '^source/index$' |
        sort
}

get_subdirs()
{
    grep '/' | 
        sed 's!/[^/]*$!!' |
        sort |
        uniq |
        sort
}

add_extra()
{
    cat ;
    echo "source"
    echo "source/arcs"
}

(echo "PAGES = $(list_wmls | xargs)" ;
echo
echo "SUBDIRS = $(list_wmls | get_subdirs | add_extra | xargs)"
echo ) > defs.mak

    
