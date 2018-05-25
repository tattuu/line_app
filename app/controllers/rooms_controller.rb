class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end

  def friends
    @friends = Friend.where(from:@current_user.id).or(Friend.where(to:@current_user.id))
    @maybefriends = MaybeFriend.find_by(to:@current_user)

  end
end
