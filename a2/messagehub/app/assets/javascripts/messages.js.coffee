# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  last_id = $('.messages').data "last"
  setInterval ->
    $.get "/messages.json", (data) ->
      renderNewMessages data, last_id
      last_id = data.length
      updateTimeAgo data
  , 10000
  
  
renderNewMessages = (data, last_id) ->
  i = data.length - last_id - 1
  while i >= 0
    prependMessage data[i]
    i--
  
  
prependMessage = (message) ->
  formatted_msg = 
    "<div class='message'>
      <p>Message: " + message.content + "</p>
      <p>From: " + message.username + "</p>
      <p>When: <abbr class='timeago' title='" + message.created_at + "'>" + $.timeago(message.created_at) + "</abbr></p>
      <br>
    </div>"
  $('.messages').prepend formatted_msg
  

updateTimeAgo = (data) ->
  $('.timeago').each (index, el) ->
    element = $(el)
    updated_time = $.timeago(element.attr('title'))
    element.html updated_time