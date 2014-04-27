# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.edit_user_detail').click ->
    $(this).next().slideToggle()
    if $(this).attr('data-flag') == '+'
      $(this).text '编辑 -'
      $(this).attr('data-flag', '-')
      $('#milestone_name').focus()
    else if $(this).attr('data-flag') == '-'
      $(this).text '编辑 +'
      $(this).attr('data-flag', '+')
