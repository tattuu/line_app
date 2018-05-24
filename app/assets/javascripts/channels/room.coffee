App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

    # Called when there's incoming data on the websocket for this channel

  speak: (message, group) ->
    @perform 'speak', message: message, group: group

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    console.log(event.target.value)
    console.log($('#group').val())
    App.room.speak event.target.value, $('#group').val()
    event.target.value = ''
    event.preventDefault()