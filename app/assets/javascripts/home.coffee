# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.like_project').click (e) ->
      $.post($(this).data('href'), {}).done (data) ->
        return $('.like_count').html data['likes']

$ ->
  $('#search').keyup ->
    $.get($(this).data('href'), {search: $(this).val()}).done (data) ->
      $(".portfolio_container").html($(data).html())

$ ->
  $('.filters input[type=radio]').change ->
    $.get($(this).data('href'), {type: $(this).val()}).done (data) ->
      $(".portfolio_container").html($(data).html())

  $('.navbar-toggler-icon').click ->
	  $nav = $('.fixed-top')
	  $nav.toggleClass 'nav-icon-background'