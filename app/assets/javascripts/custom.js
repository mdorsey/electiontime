// Toggle the hamburger menu open and close (using Bulma CSS)
function toggleBurger() {
  var burger = $('.burger');
  var menu = $('.navbar-menu');
  burger.toggleClass('is-active');
  menu.toggleClass('is-active');
}