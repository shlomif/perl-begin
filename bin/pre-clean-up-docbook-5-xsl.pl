#! /usr/bin/env perl
#
# Copyright (C) 2020 Shlomi Fish < https://www.shlomifish.org/ >
#
# Licensed under the terms of the MIT license.

use strict;
use warnings;
use 5.014;
use autodie;
s/[ \t]+\z//;
s{\Q xmlns="http://docbook.org/ns/docbook"\E}{}g;
s{(</?h)([0-9]+)}{$1.($2-1)}eg;
