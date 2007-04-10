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
            'text' => "Why?",
            'url' => "learn/",
            role => "header",
            title => "Why learn Perl?",
            'expand' => { 're' => "", },
        },
        {
            'url' => "learn/get-a-job/",
            'text' => "Get a Job!",
        },
        {
            'url' => "learn/myth-dispelling/",
            'text' => "Isn't Perl Bad?",
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
            'subs' =>
            [
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
            'text' => "Site Resources",
            'url' => "site-resources/",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'text' => "Mailing List",
                    'url' => "site-resources/mailing-list/",
                    'title' => "A mailing list for helping Beginners",
                },
                {
                    'text' => "Wiki",
                    'title' => "A sub-site that can be freely edited with any information",
                    'url' => "site-resources/wiki/",
                },
                {
                    'text' => "Web Forum",
                    'url' => "site-resources/web-forum/",
                    'title' => "A web-based forum where you can post messages",
                },
            ],
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
