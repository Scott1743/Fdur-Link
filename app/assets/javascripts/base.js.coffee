$(document).ready ->
  setTimeout ->
    $('#flash_message').slideUp()
  , 3000

  $('[data-flag="click_hidden"]').click ->
    $(this).hide()
    $(this).next().show()

