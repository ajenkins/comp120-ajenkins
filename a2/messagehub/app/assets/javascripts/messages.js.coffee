# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  last_id = $('.messages').data "last"
  setInterval ->
    $.get "/messages.json", (data) ->
      # $(".result").html data
      # alert data[0].username
      renderNewMessages data, last_id
      last_id = data.length
  , 5000
  
  
renderNewMessages = (data, last_id) ->
  console.log "Data length: " + data.length
  console.log "Last id: " + last_id
  i = data.length - last_id - 1
  while i >= 0
    prependMessage data[i]
    i--
  
  
prependMessage = (message) ->
  formatted_msg = 
    "<div class='message'>
      <p>Message: " + message.content + "</p>
      <p>From: " + message.username + "</p>
      <p>When: " + message.created_at.timeago + " ago</p>
      <br>
    </div>"
  $('.messages').prepend formatted_msg