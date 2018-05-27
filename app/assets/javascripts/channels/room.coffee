App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#posts').append data['post']

    # Called when there's incoming data on the websocket for this channel

  talk: (post, talk_id) ->
    @perform 'talk', post:post, talk_id:talk_id

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send

    App.room.talk event.target.value, location.pathname.replace("/rooms/", "")
    event.target.value = ''
    event.preventDefault()