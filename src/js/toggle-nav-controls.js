function _toggle_nav_control__is_on() {
    const elem = $("#toggle_nav_control");

    return (!(elem.hasClass("off")));
}

const _toggle_nav_control__localStorage_key = "toggle_nav_state";

function toggle_nav_control() {
    const elem = $("#toggle_nav_control");

    let newval;
    if (!_toggle_nav_control__is_on()) {
        elem.text("Hide Navigation Controls");
        newval = "on";
    }
    else {
        elem.text("Show Navigation Controls");
        newval = "off";
    }
    localStorage.setItem(_toggle_nav_control__localStorage_key, newval);
    $(".page-nav-bar, .bread").toggleClass("vis");
    elem.toggleClass("off");
    elem.toggleClass("on");
}

function _toggle_nav_onstart () {
    if (localStorage.getItem(_toggle_nav_control__localStorage_key) === "on") {
        return toggle_nav_control();
    }
}

$(_toggle_nav_onstart);
