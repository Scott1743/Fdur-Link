# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(window).scroll ->
    scrollt = document.documentElement.scrollTop + document.body.scrollTop;
    if scrollt > 500
      $("#gotop").fadeIn(400);
    else
      $("#gotop").stop().fadeOut(400);

  $("#gotop").click ->
    $("html,body").animate({scrollTop:"0px"},200);