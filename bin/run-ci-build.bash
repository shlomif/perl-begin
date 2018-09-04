#! /bin/bash
#
# run-ci-build.bash
# Copyright (C) 2018 shlomif <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
set -e
set -x
m()
{
    make DOCBOOK5_XSL_STYLESHEETS_PATH=/usr/share/xml/docbook/stylesheet/docbook-xsl-ns "$@"
}
export SKIP_SPELL_CHECK=1
./gen-helpers
m
m test
