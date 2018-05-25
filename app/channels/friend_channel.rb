class FriendChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user.name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def add(data)
    friend = Friend.findy_by(from: data['to'] ,to: current_user.id)
    if friend # 知り合いかも？から登録した時
      friend.status = 1
      friend.save
    else # 友達追加から追加した時
      Friend.create!(from: current_user.id, to: data['to'], status: 0)
    end

  end
end
