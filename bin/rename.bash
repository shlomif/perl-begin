#! /bin/bash
#
# rename.bash
# Copyright (C) 2019 Shlomi Fish <shlomif@cpan.org>
#
# Distributed under terms of the MIT license.
#
git mv "$1" "${1%%.wml}.tt2"
