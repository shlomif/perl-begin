package MyNavData;

my $hosts =
{
    'berlios' => 
    {
        'base_url' => "http://perl-begin.berlios.de/",
    },
};

sub get_hosts
{
    return $hosts;
}

my $tree_contents =
{
    'host' => "berlios",
    'text' => "Perl Beginners' Site",
    'title' => "A useful Portal for People New to Perl",
    'subs' =>
    [
        {
            'text' => "Home",
            'url' => "",
        },
        {
            'text' => "About",
            'url' => "about.html",
        },
        {
            'text' => "News",
            'url' => "news/",
            'title' => "Previous News Item",
        },
        {
            'text' => "Links",
            'url' => "links/",
            'title' => "External Links to Other Resources",
        },
        {
            'text' => "Learn Perl Now",
            'url' => "learn/",
            role => "header",
            title => "Why and how to learn Perl?",
            'expand' => { 're' => "", },
            'subs' =>
            [
                {
                    'url' => "learn/get-a-job/",
                    'text' => "Get a Job!",
                },
                {
                    'url' => "learn/myth-dispelling/",
                    'text' => "Why Perl is Good",
                },
                {
                    'url' => "learn/who-is-using/",
                    'text' => "Who is Using Perl?"
                },
            ],
        },
        {
            'url' => "resources/",
            'text' => "Resources",
            'title' => "Links to Online and Offline Resources for Learning Perl",
            role => "header",
        },
        {
            'text' => "Online Tutorials",
            'url' => "tutorials/",
            show_always => 1,
            'subs' =>
            [
                {
                    'text' => "Perl for Newbies",
                    'url' => "tutorials/perl-for-newbies/",
                    'title' => "Perl Tutorial for Beginners",
                    'subs' =>
                    [
                        {
                            'text' => "Part 1",
                            'url' => "tutorials/perl-for-newbies/part1/",
                            'title' => "Perl Basics",
                        },
                        {
                            'text' => "Part 2",
                            'url' => "tutorials/perl-for-newbies/part2/",
                            'title' => "Real Programming with Perl",
                        },
                        {
                            'text' => "Part 3",
                            'url' => "tutorials/perl-for-newbies/part3/",
                            'title' => "Modules and Objects",
                        },
                        {
                            'text' => "Part 4",
                            'url' => "tutorials/perl-for-newbies/part4/",
                            'title' => "Useful Perl Paradigms",
                        },
                    ],
                },
                {
                    'text' => "Impatient Perl",
                    'url' => "tutorials/impatient-perl/",
                    'title' => "Book for Quickly Learning Perl (based on previous knowledge)",
                },
                {
                    'text' => "Elements to Avoid",
                    'url' => "tutorials/anti-patterns/",
                    'title' => "Elements of Perl that should be avoided and what to replace them with", 
                },
                {
                    'text' => "In Other Languages",
                    'url' => "tutorials/localized/",
                    'title' => "Tutorials in languages other than English",
                },
            ],
        },
        {
            'text' => "Books",
            'url' => "books/",
            'subs' =>
            [
                {
                    'url' => "books/advanced/",
                    'text' => "Advanced Books",
                    'title' => "Books that contain more information about Perl than the basics",
                },
                {
                    'url' => "books/topics/",
                    'text' => "Topic-related Books",
                    'title' => "Books that cover certain topics in detail",
                },
            ],
        },
        {
            'url' => "IDEs-and-tools/",
            'text' => "IDEs and Development Tools",
            'title' => "Integrated Development Environments (IDEs), Programmer Editors, and other Development Tools for Perl",
        },
        {
            'url' => "core-doc/",
            'text' => "Core Docs",
        },
        {
            'url' => "articles/",
            'text' => "Article Collections",
        },
        {
            'url' => "FAQs/",
            'text' => "FAQs",
            'title' => "Lists of Frequently Asked Questions with Answers",
        },
        {
            'separator' => 1,
            'skip' => 1,
        },
        {
            'text' => "Mailing Lists",
            'url' => "mailing-lists/",
            'title' => "Ask questions and receive answers about Perl by E-mail",
        },
        {
            'text' => "Web Forums",
            'url' => "web-forums/",
            'title' => "Ask questions and receive answers by using a web-browser",
        },
        {
            'text' => "IRC Channels",
            'url' => "irc/",
            'title' => "Chat online about Perl using the Internet Relay Chat (IRC)",
        },
        {
            'text' => "Wikis",
            'url' => "wikis/",
            'title' => "Publicly editable sites with Lots of Useful Information",
        },
        {
            'text' => "Blogs",
            'url' => "blogs/",
            'title' => "Links to Perl-related Blogs (a.k.a &quot;Weblogs&quot; or online journals)",
        },
        {
            'text' => "Platforms",
            'url' => "platforms/",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'text' => "Mac OS",
                    'url' => "platforms/mac/",
                    'title' => "Macintosh and PowerPC/PowerMac Platforms",
                },
                {
                    'text' => "UNIX/Linux",
                    'url' => "platforms/unix/",
                },
                {
                    'text' => "Windows",
                    'url' => "platforms/windows/",
                },
            ],
        },
        {
            'text' => "Common Uses",
            'url' => "uses/",
            'title' => "Common Uses for Perl",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'text' => "Bio-Info",
                    'url' => "uses/bio-info/",
                    'title' => "Using Perl for Bio-Informatics",
                },
                {
                    'text' => "Databases",
                    'url' => "uses/databases/",
                    'title' => "Working with Databases (SQL, etc.) Using Perl",
                },
                {
                    'text' => "Email",
                    'url' => "uses/email/",
                    'title' => "Working with E-mail using Perl",
                },
                {
                    'text' => "GUI Development",
                    'url' => "uses/GUI/",
                    'title' => "Development of Graphical User Interface (GUIs) in Perl",
                },
                {
                    'text' => "Multitasking",
                    'url' => "uses/multitasking/",
                    'title' => "Perl for Multitasking and Networking",
                },
                {
                    'text' => "QA and Testing",
                    'url' => "uses/qa/",
                },
                {
                    'text' => "Sys Admin",
                    'title' => "Using Perl for System Administration",
                    'url' => "uses/sys-admin/",
                },
                {
                    'text' => "Text Generation",
                    'title' => "How to generate text using Perl",
                    'url' => "uses/text-generation/",
                },
                {
                    'text' => "Text Parsing",
                    'title' => "How to parse various forms of text using Perl",
                    'url' => "uses/text-parsing/",
                },
                {
                    'text' => "Web/CGI",
                    'url' => "uses/web/",
                },
                {
                    'text' => "XML",
                    'url' => "uses/xml/",
                },
            ],
        },
        {
            'text' => "Perl Topics",
            'url' => "topics/",
            'title' => "Perl-related Topics",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'text' => "Date and Time",
                    'url' => "topics/date-and-time/",
                    'title' => "Dates and Time Handling, Parsing and Processing",
                },
                {
                    'text' => "Debugging",
                    'url' => "topics/debugging/",
                    'title' => "Debugging Perl Programs",
                },
                {
                    'text' => "Hashes",
                    'url' => "topics/hashes/",
                    'title' => "Hashes / Associative Arrays for Mapping Keys to Values",
                },
                {
                    'text' => "References",
                    'url' => "topics/references/",
                    'title' => "Perl References",
                },
                {
                    'text' => "Regular Expressions",
                    'url' => "topics/regular-expressions/",
                    'title' => "Regular Expressions in Perl",
                },
                {
                    'text' => "Object Oriented Perl",
                    'url' => "topics/object-oriented/",
                    'title' => "Object Oriented Programming and Design in Perl",
                },
                {
                    'text' => "Scoping and Variables",
                    'url' => "topics/scoping/",
                    'title' => "Local variables, lexical scoping, package variables",
                },
                {
                    'text' => "Using CPAN",
                    'url' => "topics/cpan/",
                    'title' => "Effectively using CPAN - the Comprehensive Perl Archive Network",
                },
            ],
        },
        {
            'text' => "Site Resources",
            'url' => "site-resources/",
            'role' => "header",
            'show_always' => 1,
        },
        {
            'text' => "Contribute",
            'url' => "contribute/",
            'title' => "Contribute new content or corrections to this site",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'text' => "Contributors List",
                    'url' => "contribute/list/",
                },
                {
                    'text' => "Site's Source Code",
                    'url' => "source/",
                },
            ],
        },
    ],
};

sub get_params
{
    return 
        (
            'hosts' => $hosts,
            'tree_contents' => $tree_contents,
        );
}

1;
