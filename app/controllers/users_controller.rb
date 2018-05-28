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
    if !params[:image_name]
      params[:image_name] = "initial_profile.jpg"
    else 
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      Find.binwrite("publick/user_images/#{@user.image_name}", image.read)
    end
    

    @user = User.new(phone: params[:phone], name: params[:name], status_message: params[:status_message], account_id: params[:account_id], allow: params[:allow], image_name: params[:image_name])

    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      sms_send @user
      redirect_to("/login/#{@user.id}")
    else
      render("users/signup")
    end
  end

  def fix
    
  end
 
  def fix_change

  end

  def fix_run
  
  end

  def img_del
  
  end

  def add
    
  end

  def allow
    user = User.find_by(id:@current_user.id)
    if params[:id]
      user.allow = 0
    else
      user.allow = 1
    end
    user.save
    redirect_to("/friend/fix")
  end

  def search
    user = User.finid_by(account_id: params[:content])
    if user
      
    end
  end
end
