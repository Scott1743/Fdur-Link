$(document).ready ->
  $('#last_pic').one 'load', ->
    setTimeout("$('.projects').show(); $('#projects_loading').hide()" , 2000)