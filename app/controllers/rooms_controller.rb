class RoomsController < ApplicationController
  skip_before_action :current_talk_destroy,
                     only:[:friend_detail, :talk],
                     raise: false

  def friends
    @users = User.all
    @maybefriends = MaybeFriend.where.not(block: @current_user.id)
    @friends = Friend.where.not(block:@current_user.id)
    @maybefriends = @maybefriends.where(to:@current_user.id)
    @friends = @friends.where(from:@current_user.id).or(@friends.where(to:@current_user.id)) + @maybefriends.where(from: @current_user.id)

  end

  def friend_detail
    @user = User.find_by(id: params[:id])
    @maybefriends_check = MaybeFriend.find_by(from: params[:id], to:@current_user.id) # 知り合いか友達かのチェック

    talk_id_overlap = Talk.where(include: params[:id]).pluck(:talk_id) + Talk.where(include: @current_user.id).pluck(:talk_id)
    @talk_id = talk_id_overlap.group_by{|i| i}.reject{|k,v| v.one?}.keys[0]
    if not @talk_id then
      if Talk.all == [] then
        talk_id = 0
      else
        talk_id = Talk.maximum(:talk_id) + 1
      end
      Talk.create!(include: @current_user.id, talk_id: talk_id, group_name: "")
      Talk.create!(include: params[:id], talk_id: talk_id, group_name: "")
      talk_id_overlap = Talk.where(include: params[:id]).pluck(:talk_id) + Talk.where(include: @current_user.id).pluck(:talk_id)
      @talk_id = talk_id_overlap.group_by{|i| i}.reject{|k,v| v.one?}.keys[0]
    end
    CurrentTalk.create!(user_id: @current_user.id, talk_params: @talk_id)
  end

  def talk
    talk = Talk.where(talk_id: params[:id])
    @talk = talk.where.not(include: @current_user.id)
    @group_name = @talk.pluck("group_name")[0]
    @friend = User.find_by(id: @talk.pluck("include")[0])
    @posts = Post.where(talk_id:params[:id])
    CurrentTalk.create!(user_id: @current_user.id, talk_params: params[:id])
  end

  def append
    Friend.create!(from:params[:id], to: @current_user.id)
    MaybeFriend.find_by(from:params[:id], to:@current_user.id)
    redirect_to("/rooms/friends")
  end

  def delete
    if mfriend = MaybeFriend.find_by(from:params[:id], to: @current_user.id)
      if mfriend.block != 0
        mfriend.destroy
      else
        mfriend.block = @current_user.id
        mfriend.save
      end
    else
      if friend = Friend.find_by(from:params[:id], to: @current_user.id)
        if friend.block != 0
          friend.destroy
        else
          friend.block = @current_user.id
          friend.save
        end
      else
        friend = Friend.find_by(to:params[:id], from: @current_user.id)
        if friend.block  != 0
          friend.destroy
        else
          friend.block = @current_user.id
          friend.save
        end
      end
    end
    redirect_to("/rooms/friends")
  end

  def talks
    talks = Talk.where(include: @current_user.id)
    talks = talks.where(group_name:"").select("talk_id").to_a
    talk_id = []
    friend_talk = []
    @friend_name = []

    
    talks.each  do |n|
      talk_id.append(n["talk_id"])
    end
    for n in talk_id
      friend_talk.append(Talk.where(talk_id: n).where.not(include: @current_user.id).to_a)
    end
    logger.debug(friend_talk)
  end

end
