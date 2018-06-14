# change navbar color on scroll
$ ->
  $(document).scroll ->
    $nav = $('.fixed-top')
    $nav.toggleClass 'scrolled', $(this).scrollTop() > $nav.height()
    return
  return