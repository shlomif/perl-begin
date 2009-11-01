function position_divs() {
    var client_w = document.body.clientWidth ;
    var width = client_w - 780;
    var js_site_w_str = width / 2 + 20 + "px";

    var set_left = function (my_id) { $("#"+my_id).css("left", js_site_w_str);};

    set_left("js-site-name");
    set_left("js-site-slogan");

    // Commenting out because it no longer exists.
    // document.getElementById("js-nav-global").style.right = width / 2 - 20 + "px";
    if ( ! $("#right-sidebar")) {
        document.getElementById("content").style.width = client_w - 250 + "px";
    }
    else {
        document.getElementById("content").style.width = client_w - 410 + "px";
    }
}

$(document).ready( function() {
        position_divs();
} );

$(window).resize( function() {
        position_divs();
} );
