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

list_images()
{
    find ./src -type f -not -name '*.wml' -not -name '.*' | 
    grep -v '/\.svn' | 
    grep -v '~$' | 
    sed 's!^./src/!!'
}

(echo "PAGES = $(list_wmls | xargs)" ;
echo
echo "SUBDIRS = $(((list_wmls) ; (list_images))| get_subdirs | add_extra | xargs)"
echo 
echo "IMAGES = $(list_images | xargs)" ;
echo ) > defs.mak

    
