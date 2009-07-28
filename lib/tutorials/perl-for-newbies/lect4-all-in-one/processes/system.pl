#!/usr/bin/perl -w

use strict;

system("ls -l /");

my @args = ("ls", "-l", "/");
system(@args);

system("ls -l | grep ^d | wc -l");

