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
  else if $('#page_flag').attr('page-flag') == 'activities_index'
    $('a#activities_path').addClass 'selected'

  $('[data_flag="image_address_text"]').blur ->
    image_input = $(this)
    image_add = image_input.val()
    if image_add == ""
#      $('#verify_image').slideUp '', ->
      image_input.next().next().slideUp '', ->
#        $("#default_tips").slideDown()
        image_input.next().slideDown()
    else
      image_input.next().slideUp '', ->
#       $("#warnning_words").html('')
        image_input.next().next().children().last().html('')
        image_input.next().next().slideDown '', ->
#          $("#my_image").attr "src", image_add
          image_input.next().next().children().first().attr "src", image_add


  $('[img_flag="loading"]').one 'load', ->
    $(this).prev().hide()
    $(this).show()


  b_name = navigator.appName
  b_version = navigator.appVersion
  version = b_version.split(";")
  trim_version = version[1].replace(/[ ]/g, "")
  if $('body').attr('data-flag') == 'welcome'
    if (b_name == "Microsoft Internet Explorer")
      if (trim_version == "MSIE6.0" || trim_version == "MSIE7.0" || trim_version == "MSIE8.0")
        $('header').after("<div id='warnning' style=';position:fixed;left: 0;bottom:0;height:60;width:100%;min-width:960px;background-color:#DC5A03;margin: 60px 0 0 0;color:#ffffff;text-align: center;font-size: 20px;line-height: 60px;z-index: 50;opacity:0.9;filter:alpha(opacity=90);'>您的浏览器版本古老了，不能正常使用我们的产品，请使用" +
        "<a style='font-size: 20px;color: #CACACA' href='http://se.360.cn/' target='_blank'>360浏览器</a>或者" +
        "<a style='font-size: 20px;color: #CACACA' href='http://www.google.cn/intl/zh-CN/chrome/' target='_blank'>Chrome浏览器</a>等更现代的浏览器</div>")
      else
        $('header').after("<div id='warnning' style=';position:fixed;left: 0;bottom:0;height:60;width:100%;min-width:960px;background-color:#DC5A03;margin: 60px 0 0 0;color:#ffffff;text-align: center;font-size: 20px;line-height: 60px;z-index: 50;opacity:0.9;filter:alpha(opacity=90);'>检测到您正在使用ie内核的浏览器，为了您的体验更加美好，请使用最新的" +
        "<a style='font-size: 20px;color: #CACACA' href='http://se.360.cn/' target='_blank'>360浏览器</a>或者" +
        "<a style='font-size: 20px;color: #CACACA' href='http://www.google.cn/intl/zh-CN/chrome/' target='_blank'>Chrome</a>等更现代的浏览器</div>")
  setTimeout("$('#warnning').remove();$('#header').css('height','60px')",15000)


