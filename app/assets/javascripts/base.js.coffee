$(document).ready ->
  setTimeout ->
    $('#flash_message').slideUp()
  , 5000

  $('#flash_message').click ->
    $(this).slideUp()

  $('[data-flag="click_hidden"]').click ->
    $(this).hide()
    $(this).next().fadeIn('slow')
    if $('#project_name')
      $('#project_name').focus()

  $('[data-flag="click_cancel"]').click ->
    $(this).parent().parent().parent().hide()
    $(this).parent().parent().parent().prev().fadeIn('slow')

  current_path = window.location.href
  if current_path.match /\/projects/
    $('a#projects_path').addClass 'selected'

