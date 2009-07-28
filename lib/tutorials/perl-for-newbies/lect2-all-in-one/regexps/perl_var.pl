use strict;

my $string = lc(shift(@ARGV));

if ($string =~ /\$[A-Za-z_]/)
{
    print "True\n";  
}
else
{
    print "False\n";
}
