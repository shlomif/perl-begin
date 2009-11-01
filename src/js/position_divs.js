function position_divs() {
    var client_w = document.body.clientWidth ;
    var width = client_w - 780;
    var js_site_w_str = width / 2 + 20 + "px";

    var set_left = function (my_id) { $("#"+my_id).css("left", js_site_w_str);};

    set_left("js-site-name");
    set_left("js-site-slogan");

    // Commenting out because it no longer exists.
    // set_left("js-nav-global");

    $("#content").css("width",
        client_w - ($("#right-sidebar") ? 410 : 250) + "px"
    );
}

$(document).ready(position_divs);
$(window).resize(position_divs);
