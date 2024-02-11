// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

$(document).ready(function() {
  $('.checkbox-seat').change(function() {
    if($(".checkbox-seat:checked:not(:disabled)").length > 0) {
      $('.create-booking-btn').prop("disabled", false);
    } else {
      $('.create-booking-btn').prop("disabled", true);
    }
  });
});
