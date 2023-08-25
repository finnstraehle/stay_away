// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
//= require turbolinks

// document.addEventListener("turbolinks:load", function() {
//   window.scrollTo(0, 0);
// });

// document.addEventListener('turbolinks:visit', function() {
//   Turbolinks.clearCache();
// });

window.onbeforeunload = function () {
  window.scrollTo(0, 0);
}
