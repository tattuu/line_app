class RoomsController < ApplicationController
  def show
    @messages = Message.all
  end

  def friends
    
  end
end
