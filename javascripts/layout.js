(function() {
  var mainPosition, onscroll;

  mainPosition = null;

  onscroll = function() {
    var body, header, headerHeight, position;
    position = $(window).scrollTop();
    body = $('body').eq(0);
    header = $('#nav');
    $(body).attr('data-scroll-top', position);
    headerHeight = $(header).height();
    if ((mainPosition != null) && (mainPosition - (headerHeight * 2)) <= position) {
      return $(body).attr('data-scrolled-main', 'data-scrolled-main');
    } else {
      return $(body).removeAttr('data-scrolled-main');
    }
  };

  $(window).on('scroll', onscroll);

  $(function() {
    (function() {
      mainPosition = $('#mainborder').offset().top;
      return onscroll();
    })();
    return $('#nav .pulldown').on('click', function(e) {
      var attr, attrName, isPulldownClicked, nav;
      attrName = 'data-clicked-pulldown';
      nav = $('#nav');
      isPulldownClicked = false;
      attr = $(nav).attr(attrName);
      if (attr != null) {
        isPulldownClicked = true;
      }
      if (!isPulldownClicked) {
        return $(nav).attr(attrName, attrName);
      } else {
        return $(nav).removeAttr(attrName);
      }
    });
  });

}).call(this);
