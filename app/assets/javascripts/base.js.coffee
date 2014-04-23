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

  if $('#page_flag').attr('page-flag') == 'projects_index'
    $('a#projects_path').addClass 'selected'
  else if $('#page_flag').attr('page-flag') == 'users_show'
    $('a#user_path').addClass 'selected'

  $('[data_flag="image_address_text"]').blur ->
    image_add = $(this).val()
    if image_add == ""
      $('#verify_image').slideUp '', ->
        $("#default_tips").slideDown()
    else
      $("#default_tips").slideUp '', ->
        $("#warnning_words").html('')
        $("#verify_image").slideDown()
        $("#my_image").attr "src", image_add


  $('[img_flag="loading"]').one 'load', ->
    $(this).prev().hide()
    $(this).show()