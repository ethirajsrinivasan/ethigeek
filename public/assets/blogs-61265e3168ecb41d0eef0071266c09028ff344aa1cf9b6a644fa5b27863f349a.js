(function() {
  $(function() {
    $('.like_blog').click(function(e) {
      return $.post($(this).data('href'), {}).done(function(data) {
        return $('.like_count').html(data['likes']);
      });
    });
    $('.published_at_date').datepicker({
      dateFormat: 'yy-mm-dd'
    });
    $('<div class="row"><div class="col pre_copy small"><i class="far fa-copy float-end btn"> Copy</i></div></div>').insertBefore('pre');
    $('.snippet-clipboard-content').addClass('snippet-clipboard-content-background');
    $('i.far.fa-copy').click(function() {
      navigator.clipboard.writeText($(this).parent().parent().next().text());
      return $(this).text(" Copied");
    });
    return $('i.far.fa-copy').mouseout(function() {
      return $(this).text(" Copy");
    });
  });

}).call(this);
