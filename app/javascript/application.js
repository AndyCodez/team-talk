// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Select the mobile menu button
const mobileMenuButton = document.querySelector('button[aria-controls="mobile-menu"]');

// Select the mobile menu
const mobileMenu = document.getElementById('mobile-menu');

// Add an event listener to the mobile menu button to toggle the mobile menu
mobileMenuButton.addEventListener('click', function() {
  const expanded = this.getAttribute('aria-expanded') === 'true' || false;
  this.setAttribute('aria-expanded', !expanded);
  mobileMenu.classList.toggle('hidden');
});

// Select the profile dropdown button
const userMenuButton = document.getElementById('user-menu-button');

// Select the profile dropdown menu
const userMenu = document.getElementById('user-menu');

// Add an event listener to the profile dropdown button to toggle the dropdown menu
userMenuButton.addEventListener('click', function() {
  const expanded = this.getAttribute('aria-expanded') === 'true' || false;
  this.setAttribute('aria-expanded', !expanded);
  userMenu.classList.toggle('hidden');
});