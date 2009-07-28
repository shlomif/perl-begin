#!/usr/bin/perl

use strict;

use Bar2;

my $bar = Bar2->new();

$bar->assign_name("Shlomi");
$bar->assign_name("Rindolf");
print $bar->get_name(), "\n";
$bar->assign_name("Choo");

print $bar->get_num_times_assigned(), "\n";


