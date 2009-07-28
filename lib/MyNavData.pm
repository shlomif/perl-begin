package MyNavData;

my $hosts =
{
    'berlios' => 
    {
        'base_url' => "http://perl-begin.berlios.de/",
    },
};

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
                    'text' => "Isn't Perl Bad?",
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
            'text' => "Uses",
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
                    'text' => "GUI Development",
                    'url' => "uses/GUI/",
                    'title' => "Development of Graphical User Interface (GUIs) in Perl",
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
                    'text' => "Debugging",
                    'url' => "topics/debugging/",
                    'title' => "Debugging Perl Programs",
                },
                {
                    'text' => "Object Oriented Perl",
                    'url' => "topics/object-oriented/",
                    'title' => "Object Oriented Programming and Design in Perl",
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
            'subs' =>
            [
                {
                    'text' => "More",
                    'url' => "site-resources/more/",
                },
            ],
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
