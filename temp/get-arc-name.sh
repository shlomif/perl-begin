#!/bin/bash
if [ ! -e last_date ] ; then
    echo "$(date +%Y-%m-%d)" > last_date
    echo -n 0 > rev
fi
echo "Perl-Beginners-Site-$(cat last_date)-rev$(cat rev).tar.gz"

