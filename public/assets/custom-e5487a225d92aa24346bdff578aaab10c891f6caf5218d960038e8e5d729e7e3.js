(function() {
  $(function() {
    $(document).scroll(function() {
      var $nav;
      $nav = $('.fixed-top');
      $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    });
  });

}).call(this);
