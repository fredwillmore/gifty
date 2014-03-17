# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#friend_search').autocomplete
    source: "/users/2/friend_search"
    select: (event,ui) ->
      $("friend_search").val(ui.item.value)
      alert ui.item.id

  $('#add_friend').click ->
    $.post(
      "/users/2/add_friend"
      $("friend_search").val()
    )
    alert "hello"
    return false
