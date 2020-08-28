// Toggle the hamburger menu open and close (using Bulma CSS)
function toggle_burger_menu() {
  var burger = $('.burger');
  var menu = $('.navbar-menu');
  burger.toggleClass('is-active');
  menu.toggleClass('is-active');
}

// Toggle the comparison pages navigation menu select box (using Bulma CSS)
function toggle_comparison_nav_menu() {
  var dropdown = $('.dropdown');
  dropdown.toggleClass('is-active');
}