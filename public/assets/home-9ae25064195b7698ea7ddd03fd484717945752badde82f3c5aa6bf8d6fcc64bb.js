(function() {
  $(function() {
    return $('.like_project').click(function(e) {
      return $.post($(this).data('href'), {}).done(function(data) {
        return $('.like_count').html(data['likes']);
      });
    });
  });

  $(function() {
    return $('#search').keyup(function() {
      return $.get($(this).data('href'), {
        search: $(this).val()
      }).done(function(data) {
        return $(".portfolio_container").html($(data).html());
      });
    });
  });

  $(function() {
    $('.filters input[type=radio]').change(function() {
      return $.get($(this).data('href'), {
        type: $(this).val()
      }).done(function(data) {
        return $(".portfolio_container").html($(data).html());
      });
    });
    return $('.navbar-toggler-icon').click(function() {
      var $nav;
      $nav = $('.navbar');
      return $nav.toggleClass('nav-icon-background');
    });
  });

  if (!window.location.pathname.endsWith('.html')) {
    if (window.location.pathname.localeCompare("/") !== 0) {
      window.location.pathname = window.location.pathname.replace(/\.[^\/.]+$/, '') + '.html';
    }
  }

}).call(this);
