#!/bin/bash
rm -fr Beginners
svn export http://opensvn.csie.org/perlbegin/perl-begin/trunk/ Beginners
date="$(date +%Y-%m-%d)"
test -e last_date && old_date="$(cat last_date)"
test -e rev && rev="$(cat rev)"
dir_name="Perl-Beginners-Site-$date"
mv Beginners "$dir_name"
if [ "$date" == "$old_date" ] ; then
    let rev++;
else
    rev=1
fi
echo "$date" > last_date
echo "$rev"  > rev
arc_name=$(./get-arc-name.sh)
tar -czvf "$arc_name" "$dir_name"
rm -fr "$dir_name"
