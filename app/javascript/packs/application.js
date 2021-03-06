// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery'
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("stylesheets/application.scss")

// Jquery
global.$ = jQuery;
global.toastr = require("toastr")

// datatables
require('datatables.net-bs4')
require('packs/datatables')
require("trix")
require("@rails/actiontext")

$(document).on('turbolinks:load', function() {
  // Handle adding and removing of permissions
  $('form').on('click', '.add_permissions', function(event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('.new-permission').append($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });

  $('form').on('click', '.remove_permission', function(event) {
    let field_parent = this.closest('.card-container');
    let delete_field = field_parent ? field_parent.querySelector('input[type="hidden"]') : null;

    if (delete_field) {
      delete_field.value = 1;
      field_parent.style.display = 'none';
    }
    
    return event.preventDefault();
  });

  $('#selectAll').click(function() {
    if (this.checked) {
      $(':checkbox').each(function() {
        this.checked = true;                        
      });
    } else {
      $(':checkbox').each(function() {
        this.checked = false;                        
      });
    } 
  });

  window.addEventListener("trix-file-accept", function(event) {
    event.preventDefault()
    alert("File attachment not supported!")
  })

  let min_number_of_credits_form_input = $('.requirement_minimum_amount_of_credits')
  let requirement_courses = $('.requirement_courses')

  $('#requirement_description_only').on('change', function() {
    if ($(this).is(':checked')) {
      min_number_of_credits_form_input.hide()
      requirement_courses.hide()
    } else {
      min_number_of_credits_form_input.show()
      requirement_courses.show()
    }
  })

});