(($) ->
  moment.lang('ja');
  
  mainPosition = null

  onscroll = ->
    position = $(window).scrollTop()

    body = $('body').eq(0)
    header = $('#nav')
    $(body).attr 'data-scroll-top', position

    headerHeight = $(header).height()

    if mainPosition? and (mainPosition - (headerHeight * 2) ) <= position
      $(body).attr 'data-scrolled-main', 'data-scrolled-main'
    else
      $(body).removeAttr 'data-scrolled-main'

  $(window).on 'scroll', onscroll

  $ ->
    (() ->
      mainPosition = $('#mainborder').offset().top;
      onscroll()
    )()
    $('#nav .pulldown').on 'click', (e) ->
      attrName = 'data-clicked-pulldown'
      nav = $('#nav')
      isPulldownClicked = false
      attr = $(nav).attr(attrName)
      if attr?
        isPulldownClicked = true
      if !isPulldownClicked
        $(nav).attr attrName, attrName
      else
        $(nav).removeAttr attrName
)(jQuery)