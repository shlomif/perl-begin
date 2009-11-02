    var width = client_w - 800;
    var js_site_w_str = width / 2 + 20 + "px";

    var set_left = function (my_id) { $("#"+my_id).css("left", js_site_w_str);};

    set_left("js-site-name");
    set_left("js-site-slogan");

    // Commenting out because it no longer exists.
    // set_left("js-nav-global");


