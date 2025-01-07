function _toggle_nav_control__is_on() {
    const elem = $("#toggle_nav_control");

    return (!(elem.hasClass("off")));
}

function toggle_nav_control() {
    const elem = $("#toggle_nav_control");

    if (!_toggle_nav_control__is_on()) {
        elem.text("Hide Navigation Controls");
    }
    else {
        elem.text("Show Navigation Controls");
    }
    $(".page-nav-bar, .bread").toggleClass("vis");
    elem.toggleClass("off");
    elem.toggleClass("on");
}


