function toggle_nav_control() {
    var elem = $("#toggle_nav_control");

    if (elem.hasClass("off")) {
        elem.text("Hide Navigation Controls");
    }
    else {
        elem.text("Show Navigation Controls");
    }
    $(".page-nav-bar, .bread").toggleClass("vis");
    elem.toggleClass("off");
    elem.toggleClass("on");
}
