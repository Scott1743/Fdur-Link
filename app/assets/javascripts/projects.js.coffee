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

  $('[data-flag="edit_project"]').click ->
    $(this).parent().parent().hide()
    $(this).parent().parent().next().fadeIn()
    if $('[checked="checked"]').attr('id') == 'project_is_public_false'
      $("[for='project_is_public_false']").click()

  $('.new_milestone').click ->
    $(this).next().slideToggle()
    if $(this).attr('data-flag') == '+'
      $(this).text '新增 -'
      $(this).attr('data-flag', '-')
      $(this).next().children().children().first().next().children().first().next().focus();
    else if $(this).attr('data-flag') == '-'
      $(this).text '新增 +'
      $(this).attr('data-flag', '+')

  $('.milestone_state').click ->
    $('.milestone_state').css('font-weight': 'normal')
    $(this).css('font-weight': '600')
    t = $(this).attr('data-flag')
    if t == 'all'
      $('.milestone_flag').show()
      $('dt[data-flag="comment"]').hide()
    else
      $('.milestone_flag').hide()
      $('dt[data-flag="' + "#{t}" + '"]').show()
    $('#project_show_information').attr('data-flag': t)

  #评论标识
  comment_flag = window.location.href.match 'http://[\\s\\S]*comment=(\\d)'
  unless comment_flag == null
    comment_flag = comment_flag[1]
  if comment_flag == "1"
    $('a[data-flag="comment"]').click()
  else
    $('a[data-flag="all"]').click()




