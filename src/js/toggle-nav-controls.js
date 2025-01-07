function _toggle_nav_control__get_button() {
    const elem = $("#toggle_nav_control");

    return elem;
}

function _toggle_nav_control__is_on() {
    const elem = _toggle_nav_control__get_button();

    return (!(elem.hasClass("off")));
}

const _toggle_nav_control__localStorage_key = "toggle_nav_state";

function toggle_nav_control() {
    const elem = _toggle_nav_control__get_button();

    let newtext;
    let newval;
    if (!_toggle_nav_control__is_on()) {
        newtext = "Hide Navigation Controls";
        newval = "on";
    }
    else {
        newtext = "Show Navigation Controls";
        newval = "off";
    }
    elem.text(newtext);
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
