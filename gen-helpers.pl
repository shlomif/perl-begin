#!/usr/bin/perl

use strict;
use warnings;

use HTML::Latemp::GenMakeHelpers;

my $generator = 
    HTML::Latemp::GenMakeHelpers->new(
        'hosts' =>
        [
            {
                'id' => "common",
                'source_dir' => "common",
                'dest_dir' => "\$(TARGET)",
            },
            {
                'id' => "berlios",
                'source_dir' => "src",
                'dest_dir' => "\$(TARGET)",
            },
        ],
    );
    
$generator->process_all();

1;

