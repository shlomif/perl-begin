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
    'value' => "Perl Beginners' Site",
    'title' => "A useful Portal for People New to Perl",
    'expand_re' => "",
    'subs' =>
    [
        {
            'value' => "Home",
            'url' => "",
        },
        {
            'value' => "About",
            'url' => "about.html",
        },
        {
            'value' => "News",
            'url' => "news/",
            'title' => "Previous News Item",
        },
        {
            'value' => "Online Tutorials",
            'url' => "tutorials/",
            'subs' =>
            [
                {
                    'value' => "In Other Languages",
                    'url' => "tutorials/localized/",
                    'title' => "Tutorials in languages other than English",
                },
            ],
        },
        {
            'value' => "Books",
            'url' => "books/",
            'subs' =>
            [
                {
                    'url' => "books/advanced/",
                    'value' => "Advanced Books",
                    'title' => "Books that contain more information about Perl than the basics",
                },
                {
                    'url' => "books/topics/",
                    'value' => "Topic-related Books",
                    'title' => "Books that cover certain topics in detail",
                },
            ],
        },
        {
            'url' => "core-doc/",
            'value' => "Core Documentation",
        },
        {
            'url' => "articles/",
            'value' => "Article Collections",
        },
        {
            'separator' => 1,
            'skip' => 1,
        },
        {
            'value' => "Mailing Lists",
            'url' => "mailing-lists/",
            'title' => "Ask questions and receive answers about Perl by E-mail",
        },
        {
            'value' => "Web Forums",
            'url' => "web-forums/",
            'title' => "Ask questions and receive answers by using a web-browser",
        },
        {
            'value' => "IRC Channels",
            'url' => "irc/",
            'title' => "Chat online about Perl using the Internet Relay Chat (IRC)",
        },
        {
            'value' => "Site Resources",
            'url' => "site-resources/",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'value' => "Mailing List",
                    'url' => "site-resources/mailing-list/",
                    'title' => "A mailing list for helping Beginners",
                },
                {
                    'value' => "Wiki",
                    'title' => "A sub-site that can be freely edited with any information",
                    'url' => "site-resources/wiki/",
                },
                {
                    'value' => "Web Forum",
                    'url' => "site-resources/web-forum/",
                    'title' => "A web-based forum where you can post messages",
                },
            ],
        },
        {
            'value' => "Platforms",
            'url' => "platforms/",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'value' => "Mac OS",
                    'url' => "platforms/mac/",
                    'title' => "Macintosh and PowerPC/PowerMac Platforms",
                },
                {
                    'value' => "UNIX/Linux",
                    'url' => "platforms/unix/",
                },
                {
                    'value' => "Windows",
                    'url' => "platforms/windows/",
                },
            ],
        },
        {
            'value' => "Uses",
            'url' => "uses/",
            'title' => "Common Uses for Perl",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'value' => "Bio-Informatics",
                    'url' => "uses/bio-info/",
                },
                {
                    'value' => "QA and Testing",
                    'url' => "uses/qa/",
                },
                {
                    'value' => "Sys Admin",
                    'title' => "Using Perl for System Administration",
                    'url' => "uses/sys-admin/",
                },
                {
                    'value' => "Web/CGI",
                    'url' => "uses/web/",
                },
            ],
        },
        {
            'value' => "Contribute",
            'url' => "contribute/",
            'title' => "Contribute new content or corrections to this site",
            'role' => "header",
            'show_always' => 1,
            'subs' =>
            [
                {
                    'value' => "Site's Source Code",
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
