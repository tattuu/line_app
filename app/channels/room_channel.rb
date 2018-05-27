class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "room_channel"
    stream_for talk_id
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def talk(data)
    Post.create!(talk_id: data['talk_id'], speaker: current_user.id, content: data['post'])
  end
end