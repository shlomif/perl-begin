#!/usr/bin/perl

use strict;
use warnings;

use 5.010;

my $s = <<'EOF';
Name: John
Address: 4 George St.
Pets: Dog
Name: Martha
Address: 4 Oxfordshire
Pets: Cat
Name: Sophie
Address: 25 Zebra Lane.
Pets: Ferret
EOF

pos($s) = 0;
my @results;
while ($s =~ /\GName:(?<name>[^\n]+)\nAddress:(?<address>[^\n]+)\nPets:(?<pets>[^\n]+)\n/gms)
{
    push @results, +{ (map { $_ => $+{$_} } qw(name address pets)) };
}

use Data::Dumper;
print Dumper(\@results);
