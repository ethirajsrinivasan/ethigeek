# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.like_blog').click (e) ->
      $.post($(this).data('href'), {}).done (data) ->
        return $('.like_count').html data['likes']

  $('.published_at_date').datepicker({ dateFormat: 'yy-mm-dd' })


  $('pre').prepend '<i class="far fa-copy float-end btn"> Copy</i>'

  $('.snippet-clipboard-content').addClass 'snippet-clipboard-content-background'


  $('i.far.fa-copy').click ->
    navigator.clipboard.writeText($(this).parent().text().slice(5))
    $(this).text(" Copied")

  $('i.far.fa-copy').mouseout ->
    $(this).text(" Copy")  

