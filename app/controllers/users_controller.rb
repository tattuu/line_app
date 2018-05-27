class UsersController < ApplicationController
  include UsersHelper
  def index
  end

  def login

    require 'twilio-ruby'

    @user = User.find_by(phone: params[:phone])
    # バリデーションをする！(電話番号しか受け付けない！)
    if @user
      sms_send @user
      flash[:notice] = "あとちょっと！"
      redirect_to("/login/#{@user.id}")
    else
      flash[:notice] = "正しい電話番号を入れてね"
      render("users/index")
    end
  end

  def sms

  end

  def sms_auth 
    @user = User.find_by(id: params[:id])
    if @user.sms == params[:password]
      @user.sms = ""
      @user.save
      flash[:notice] = "Welcome!"
      log_in @user
      remember @user
      redirect_to("/rooms/friends")
    else
      flash[:notice] = 'Invalid phone_num/auth_num combination'
      render("users/sms")
    end
  end

  def top
    
  end

  def signup
  end

  def create

    @user = User.new(phone: params[:phone], name: params[:name], image_name: "initial_profile.jpg")
    # 保存が成功したかどうかで条件分岐をしてください
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      sms_send @user
      redirect_to("/login/#{@user.id}")
    else
      render("users/signup")
    end
  end

end
