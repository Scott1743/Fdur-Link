# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("[for='project_is_public_false']").click ->
    $("[for='project_is_public_true']").css 'background-color': 'transparent'
    $(this).css 'background-color': '#F08080'
    $("#new_project_form p").css 'background-color': '#F08080'
    $('#project_name').focus()

  $("[for='project_is_public_true']").click ->
    $("[for='project_is_public_false']").css 'background-color': 'transparent'
    $(this).css 'background-color': '#67B4B1'
    $("#new_project_form p").css 'background-color': '#67B4B1'
    $('#project_name').focus()
