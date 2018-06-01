# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.like_blog').click (e) ->
      $.post($(this).data('href'), {}).done (data) ->
        return $('.like_count').html data['likes']

#ß  $('.published_at_date').fdatepicker()