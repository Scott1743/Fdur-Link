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
      $('#milestone_name').focus()
    else if $(this).attr('data-flag') == '-'
      $(this).text '新增 +'
      $(this).attr('data-flag', '+')

#  $('a[data-flag="all"]').click ->
#    $('.milestone_state').css('font-weight': 'normal')
#    $(this).css('font-weight': '600')
#    $("dt[data-flag='undo']").show()
#    $("dt[data-flag='doing']").show()
#    $("dt[data-flag='finished']").show()
#    $('#project_show_information').attr('data-flag': 'all')
#
#  $('a[data-flag="undo"]').click ->
#    $('.milestone_state').css('font-weight': 'normal')
#    $(this).css('font-weight': '600')
#    $("dt[data-flag='undo']").show()
#    $("dt[data-flag='doing']").hide()
#    $("dt[data-flag='finished']").hide()
#    $('#project_show_information').attr('data-flag': 'undo')
#
#  $('a[data-flag="doing"]').click ->
#    $('.milestone_state').css('font-weight': 'normal')
#    $(this).css('font-weight': '600')
#    $("dt[data-flag='doing']").show()
#    $("dt[data-flag='undo']").hide()
#    $("dt[data-flag='finished']").hide()
#    $('#project_show_information').attr('data-flag': 'doing')
#
#  $('a[data-flag="finished"]').click ->
#    $('.milestone_state').css('font-weight': 'normal')
#    $(this).css('font-weight': '600')
#    $("dt[data-flag='finished']").show()
#    $("dt[data-flag='undo']").hide()
#    $("dt[data-flag='doing']").hide()
#    $('#project_show_information').attr('data-flag': 'finished')

  $('.milestone_state').click ->
    $('.milestone_state').css('font-weight': 'normal')
    $(this).css('font-weight': '600')
    t = $(this).attr('data-flag')
    if t == 'all'
      $('.milestone_flag').show()
    else
      $('.milestone_flag').hide()
      $('dt[data-flag="' + "#{t}" + '"]').show()
    $('#project_show_information').attr('data-flag': t)


  $('a[data-flag="all"]').click()



