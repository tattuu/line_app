class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end

  def friends
    @maybefriends = MaybeFriend.where(to:@current_user.id)
    @friends = Friend.where(from:@current_user.id).or(Friend.where(to:@current_user.id))

  end
end
