package MyNavData;

use strict;
use warnings;

use utf8;

my $hosts =
{
    perl_begin =>
    {
        base_url => "http://perl-begin.org/",
    },
};

sub get_hosts
{
    return $hosts;
}

my $tree_contents =
{
    host => "perl_begin",
    text => "Perl Beginners’ Site",
    title => "A useful Portal for People New to Perl",
    subs =>
    [
        {
            text => "Home",
            url => "",
        },
        {
            text => "About",
            url => "about.html",
        },
        {
            text => "News",
            url => "news/",
            title => "Previous News Item",
        },
        {
            text => "Links",
            url => "links/",
            title => "External Links to Other Resources",
        },
        {
            text => "Perl Humour",
            url => "humour/",
            title => "Perl Humour and Links to Perl Humour resources",
        },
        {
            url => "resources/",
            text => "Resources",
            title => "Links to Online and Offline Resources for Learning Perl",
            role => "header",
        },
        {
            text => "Online Tutorials",
            url => "tutorials/",
            show_always => 1,
            subs =>
            [
                {
                    text => "Modern Perl by chromatic",
                    url => "tutorials/modern-perl/",
                    title => "The book “Modern Perl” by chromatic.",
                },
                {
                    text => qq{The "Perl for Newbies" Tutorial},
                    url => "tutorials/perl-for-newbies/",
                    title => "Perl Tutorial for Beginners",
                    subs =>
                    [
                        {
                            text => "Part 1",
                            url => "tutorials/perl-for-newbies/part1/",
                            title => "Perl Basics",
                        },
                        {
                            text => "Part 2",
                            url => "tutorials/perl-for-newbies/part2/",
                            title => "Real Programming with Perl",
                        },
                        {
                            text => "Part 3",
                            url => "tutorials/perl-for-newbies/part3/",
                            title => "Modules and Objects",
                        },
                        {
                            text => "Part 4",
                            url => "tutorials/perl-for-newbies/part4/",
                            title => "Useful Perl Paradigms",
                        },
                        {
                            text => "Part 5",
                            url => "tutorials/perl-for-newbies/part5/",
                            title => "Good Programming Practices",
                        },
                    ],
                },
                {
                    text => "Impatient Perl",
                    url => "tutorials/impatient-perl/",
                    title => "Book for Quickly Learning Perl (based on previous knowledge)",
                },
                {
                    text => "Hyperpolyglot",
                    url => "tutorials/hyperpolyglot/",
                    title => "Our mirror for the lingo of Perl and other languages under CC-by-sa",
                    subs =>
                    [
                        {
                            text => "Sheet 1",
                            url => "tutorials/hyperpolyglot/sheet1.html",
                        },
                        {
                            text => "Sheet 2",
                            url => "tutorials/hyperpolyglot/sheet2.html",
                        },
                    ],
                },
                {
                    text => "Elements to Avoid",
                    url => "tutorials/bad-elements/",
                    title => "Elements of Perl that should be avoided and what to replace them with",
                },
                {
                    text => "In Other Languages",
                    url => "tutorials/localized/",
                    title => "Tutorials in languages other than English",
                },
            ],
        },
        {
            text => "Books",
            url => "books/",
            subs =>
            [
                {
                    url => "books/advanced/",
                    text => "Advanced Books",
                    title => "Books that contain more information about Perl than the basics",
                },
                {
                    url => "books/topics/",
                    text => "Topic-related Books",
                    title => "Books that cover certain topics in detail",
                },
            ],
        },
        {
            url => "IDEs-and-tools/",
            text => "IDEs and Development Tools",
            title => "Integrated Development Environments (IDEs), Programmer Editors, and other Development Tools for Perl",
            subs =>
            [
                {
                    url => "IDEs-and-tools/Perl_developer_tools/",
                    text => "From perl.net.au",
                    title => "Restored page from perl.net.au",
                },
            ],
        },
        {
            url => "core-doc/",
            text => "Core Docs",
        },
        {
            url => "articles/",
            text => "Article Collections",
        },
        {
            url => "training/",
            text => "Training",
            title => "Take paid courses for learning Perl",
        },
        {
            url => "FAQs/",
            text => "FAQs",
            title => "Lists of Frequently Asked Questions with Answers",
            show_always => 1,
            subs =>
            [
                {
                    url => "FAQs/freenode-perl/",
                    text => "Freenode’s #perl FAQ",
                    title => "The Frequently Asked Questions List for the Freenode Perl Channel",
                },
            ],
        },
        {
            url => "exercises/",
            text => "Exercises and Challenges",
            title => "Links to Exercises and Challenges for Practice",
        },
        {
            separator => 1,
            skip => 1,
        },
        {
            text => "Mailing Lists",
            url => "mailing-lists/",
            title => "Ask questions and receive answers about Perl by E-mail",
        },
        {
            text => "Web Forums",
            url => "web-forums/",
            title => "Ask questions and receive answers by using a web-browser",
        },
        {
            text => "IRC Channels",
            url => "irc/",
            title => "Chat online about Perl using the Internet Relay Chat (IRC)",
        },
        {
            separator => 1,
            skip => 1,
        },
        {
            text => "Reference Resources",
            url => "reference-resources/",
            title => "Resources for reference about Perl and looking up information.",
        },
        {
            text => "Wikis",
            url => "wikis/",
            title => "Publicly editable sites with Lots of Useful Information",
        },
        {
            text => "Blogs",
            url => "blogs/",
            title => "Links to Perl-related Blogs (a.k.a &quot;Weblogs&quot; or online journals)",
        },
        {
            text => "Platforms",
            url => "platforms/",
            role => "header",
            show_always => 1,
            subs =>
            [
                {
                    text => "Mac OS",
                    url => "platforms/mac/",
                    title => "Macintosh and PowerPC/PowerMac Platforms",
                },
                {
                    text => "UNIX/Linux",
                    url => "platforms/unix/",
                },
                {
                    text => "Windows",
                    url => "platforms/windows/",
                },
            ],
        },
        {
            text => "Common Uses",
            url => "uses/",
            title => "Common Uses for Perl",
            role => "header",
            show_always => 1,
            subs =>
            [
                {
                    text => "Bio-Info",
                    url => "uses/bio-info/",
                    title => "Using Perl for Bio-Informatics",
                },
                {
                    text => "Chat Bots and Scripting (IRC, XMPP)",
                    url => "uses/chat-scripting/",
                    title => "Writing chat (IRC, Jabber and other IM) bots in Perl and general chat scripting",
                },
                {
                    text => "Databases",
                    url => "uses/databases/",
                    title => "Working with Databases (SQL, etc.) Using Perl",
                },
                {
                    text => "Email",
                    url => "uses/email/",
                    title => "Working with E-mail using Perl",
                },
                {
                    text => "Games and Multimedia",
                    url => "uses/games/",
                    title => "Developing Games and Multimedia Applications in Perl",
                },
                {
                    text => "GUI Development",
                    url => "uses/GUI/",
                    title => "Development of Graphical User Interface (GUIs) in Perl",
                },
                {
                    text => "Multitasking",
                    url => "uses/multitasking/",
                    title => "Perl for Multitasking and Networking",
                },
                {
                    text => "QA and Testing",
                    url => "uses/qa/",
                },
                {
                    text => "SSH/Telnet",
                    url => "uses/remote-login-and-commands/",
                    title => "Remote login and execution of commands (SSH, Telnet, etc.)",
                },
                {
                    text => "Sys Admin",
                    title => "Using Perl for System Administration",
                    url => "uses/sys-admin/",
                },
                {
                    text => "Text Generation",
                    title => "How to generate text using Perl",
                    url => "uses/text-generation/",
                },
                {
                    text => "Text Parsing",
                    title => "How to parse various forms of text using Perl",
                    url => "uses/text-parsing/",
                },
                {
                    text => "Web Automation",
                    title => "Perform operations on web-site programatically and automatically",
                    url => "uses/web-automation/",
                },
                {
                    text => "Web/CGI",
                    url => "uses/web/",
                },
                {
                    text => "XML",
                    url => "uses/xml/",
                },
            ],
        },
        {
            text => "Perl Topics",
            url => "topics/",
            title => "Perl-related Topics",
            role => "header",
            show_always => 1,
            subs =>
            [
                {
                    text => "Date and Time",
                    url => "topics/date-and-time/",
                    title => "Dates and Time Handling, Parsing and Processing",
                },
                {
                    text => "Debugging",
                    url => "topics/debugging/",
                    title => "Debugging Perl Programs",
                },
                {
                    text => "Files and Directories",
                    url => "topics/files-and-directories/",
                    title => "Handling Files and Directories in Perl",
                },
                {
                    text => "Hashes",
                    url => "topics/hashes/",
                    title => "Hashes / Associative Arrays for Mapping Keys to Values",
                },
                {
                    text => "Modules and Packages",
                    url => "topics/modules-and-packages/",
                    title => "Encapsulate code in reusable units and use namespaces effectively.",
                },
                {
                    text => "References",
                    url => "topics/references/",
                    title => "Perl References",
                },
                {
                    text => "Regular Expressions",
                    url => "topics/regular-expressions/",
                    title => "Regular Expressions in Perl",
                },
                {
                    text => "Object Oriented Perl",
                    url => "topics/object-oriented/",
                    title => "Object Oriented Programming and Design in Perl",
                },
                {
                    text => "Optimising and Profiling",
                    url => "topics/optimising-and-profiling/",
                    title => "How (and When) to make your Perl programs faster",
                },
                {
                    text => "Scoping and Variables",
                    url => "topics/scoping/",
                    title => "Local variables, lexical scoping, package variables",
                },
                {
                    text => "Using CPAN",
                    url => "topics/cpan/",
                    title => "Effectively using CPAN - the Comprehensive Perl Archive Network",
                    subs =>
                    [
                        {
                            text => "CPAN Wrappers for Creating System Packages",
                            url => "topics/cpan/wrappers-for-distributions/",
                            title => "Wrap CPAN packages in native packages of your Linux/BSD/etc. distributions.",
                        },
                        {
                            text => "Finding Stuff on CPAN",
                            url => "topics/cpan/finding-stuff-on-cpan/",
                        },
                    ],
                },
            ],
        },
        {
            text => "Advocacy",
            url => "learn/",
            role => "header",
            title => "Perl advocacy - why you should learn it, and some issues.",
            subs =>
            [
                {
                    url => "learn/perl6/",
                    text => "What about Perl 6?"
                },
                {
                    url => "learn/Perl-perl-but-not-PERL/",
                    text => "&quot;Perl&quot;, and &quot;perl&quot;, but not &quot;PERL&quot;"
                },
                {
                    url => "learn/get-a-job/",
                    text => "Get a Job!",
                },
                {
                    url => "learn/why-perl/",
                    text => "Why Perl is Good",
                },
                {
                    url => "learn/who-is-using/",
                    text => "Who is Using Perl?"
                },
            ],
        },
        {
            text => "Site Resources",
            url => "site-resources/",
            role => "header",
            show_always => 1,
        },
        {
            text => "Contribute",
            url => "contribute/",
            title => "Contribute new content or corrections to this site",
            role => "header",
            show_always => 1,
            subs =>
            [
                {
                    text => "Contributors List",
                    url => "contribute/list/",
                },
                {
                    text => "Site’s Source Code",
                    url => "source/",
                },
            ],
        },
    ],
};

sub get_params
{
    return
        (
            hosts => $hosts,
            tree_contents => $tree_contents,
        );
}

1;
