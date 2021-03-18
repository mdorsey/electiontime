// These functions are loaded globally

// Toggle the hamburger menu open and close (using Bulma CSS)
global.toggle_burger_menu = function() {
  var burger = $('.burger');
  var menu = $('.navbar-menu');
  burger.toggleClass('is-active');
  menu.toggleClass('is-active');
}

// Toggle the comparison pages navigation menu select box (using Bulma CSS)
// and add event listeners to smooth scroll to the appropriate section
global.toggle_comparison_menu_dropdown = function() {
  var dropdown = $('.dropdown');
  dropdown.toggleClass('is-active');

  if (dropdown.hasClass("is-active")) {
    document.querySelectorAll('.dropdown-item').forEach(item => {
      item.addEventListener('click', event => {
        
        event.preventDefault();

        // Get the destination ID from the item's ID, minus the string "scroll_to_"
        destination_id = '#' +  item.id.substring(10);

        // Add the smooth scrolling to that element
        destination_element = document.querySelector(destination_id);        
        if (destination_element) {
          destination_element.scrollIntoView({ behavior: 'smooth' });
        }
      })
    })
  }
}